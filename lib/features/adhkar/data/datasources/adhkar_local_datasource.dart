import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../logic/entity/adhkar_category_entity.dart';
import '../../logic/entity/adhkar_collection.dart';
import '../../logic/entity/adhkar_item_entity.dart' as domain;
import '../../logic/entity/adhkar_item_progress.dart';
import '../../logic/entity/adhkar_progress_entity.dart';

abstract class AdhkarLocalDatasource {
  Future<void> importCollection(AdhkarCollection collection);

  Future<List<AdhkarCategoryEntity>> getCategories();

  Future<List<domain.AdhkarItemEntity>> getItemsForCategory(String categoryKey);

  Future<List<AdhkarItemProgress>> getProgressForCategory({
    required String categoryKey,
    required DateTime date,
    String? ownerUserId,
  });

  Future<AdhkarProgressEntity> incrementCounter({
    required domain.AdhkarItemEntity item,
    required DateTime date,
    String? ownerUserId,
  });
}

class DriftAdhkarLocalDatasource implements AdhkarLocalDatasource {
  const DriftAdhkarLocalDatasource(this._database);

  final AppDatabase _database;

  @override
  Future<void> importCollection(AdhkarCollection collection) async {
    final now = DateTime.now().toUtc();
    await _database.batch((batch) {
      for (final category in collection.categories) {
        batch.insert(
          _database.adhkarCategories,
          AdhkarCategoriesCompanion.insert(
            categoryKey: category.key,
            titleArabic: category.titleArabic,
            titleEnglish: Value(category.titleEnglish),
            source: category.source,
            createdAt: now,
            updatedAt: now,
          ),
          mode: InsertMode.insertOrReplace,
        );

        for (final item in category.items) {
          batch.insert(
            _database.adhkarItems,
            AdhkarItemsCompanion.insert(
              itemKey: item.key,
              categoryKey: item.categoryKey,
              textArabic: item.textArabic,
              textEnglish: Value(item.textEnglish),
              repeatCount: Value(item.repeatCount),
              source: item.source,
              sourceReference: item.sourceReference,
              createdAt: now,
              updatedAt: now,
            ),
            mode: InsertMode.insertOrReplace,
          );
        }
      }
    });
  }

  @override
  Future<List<AdhkarCategoryEntity>> getCategories() async {
    final rows = await (_database.select(
      _database.adhkarCategories,
    )..orderBy([(table) => OrderingTerm.asc(table.id)])).get();

    return rows
        .map(
          (row) => AdhkarCategoryEntity(
            key: row.categoryKey,
            titleArabic: row.titleArabic,
            titleEnglish: row.titleEnglish,
            source: row.source,
            items: const [],
          ),
        )
        .toList();
  }

  @override
  Future<List<domain.AdhkarItemEntity>> getItemsForCategory(
    String categoryKey,
  ) async {
    final rows =
        await (_database.select(_database.adhkarItems)
              ..where((table) => table.categoryKey.equals(categoryKey))
              ..orderBy([(table) => OrderingTerm.asc(table.id)]))
            .get();

    return rows
        .map(
          (row) => domain.AdhkarItemEntity(
            key: row.itemKey,
            categoryKey: row.categoryKey,
            textArabic: row.textArabic,
            textEnglish: row.textEnglish,
            repeatCount: row.repeatCount,
            source: row.source,
            sourceReference: row.sourceReference,
          ),
        )
        .toList();
  }

  @override
  Future<List<AdhkarItemProgress>> getProgressForCategory({
    required String categoryKey,
    required DateTime date,
    String? ownerUserId,
  }) async {
    final items = await getItemsForCategory(categoryKey);
    final progressDate = _dateOnly(date);

    return Future.wait(
      items.map((item) async {
        final progress = await _findProgress(
          itemKey: item.key,
          progressDate: progressDate,
          ownerUserId: ownerUserId,
        );
        final currentCount = progress?.currentCount ?? 0;
        return AdhkarItemProgress(
          item: item,
          progress: progress,
          currentCount: currentCount,
          isCompleted: currentCount >= item.repeatCount,
        );
      }),
    );
  }

  @override
  Future<AdhkarProgressEntity> incrementCounter({
    required domain.AdhkarItemEntity item,
    required DateTime date,
    String? ownerUserId,
  }) async {
    final now = DateTime.now().toUtc();
    final progressDate = _dateOnly(date);
    final existing = await _findProgress(
      itemKey: item.key,
      progressDate: progressDate,
      ownerUserId: ownerUserId,
    );

    if (existing == null) {
      final currentCount = item.repeatCount <= 0 ? 0 : 1;
      final id = await _database
          .into(_database.adhkarProgressCounters)
          .insert(
            AdhkarProgressCountersCompanion.insert(
              itemKey: item.key,
              progressDate: progressDate,
              currentCount: Value(currentCount),
              isCompleted: Value(currentCount >= item.repeatCount),
              ownerUserId: Value(ownerUserId),
              createdAt: now,
              updatedAt: now,
            ),
          );
      return AdhkarProgressEntity(
        id: id,
        itemKey: item.key,
        progressDate: progressDate,
        currentCount: currentCount,
        isCompleted: currentCount >= item.repeatCount,
        ownerUserId: ownerUserId,
      );
    }

    final nextCount = existing.currentCount >= item.repeatCount
        ? item.repeatCount
        : existing.currentCount + 1;
    await (_database.update(
      _database.adhkarProgressCounters,
    )..where((table) => table.id.equals(existing.id))).write(
      AdhkarProgressCountersCompanion(
        currentCount: Value(nextCount),
        isCompleted: Value(nextCount >= item.repeatCount),
        updatedAt: Value(now),
        syncStatus: const Value('local'),
      ),
    );

    return AdhkarProgressEntity(
      id: existing.id,
      itemKey: item.key,
      progressDate: progressDate,
      currentCount: nextCount,
      isCompleted: nextCount >= item.repeatCount,
      ownerUserId: ownerUserId,
    );
  }

  Future<AdhkarProgressEntity?> _findProgress({
    required String itemKey,
    required DateTime progressDate,
    required String? ownerUserId,
  }) async {
    final query = _database.select(_database.adhkarProgressCounters)
      ..where((table) => table.itemKey.equals(itemKey))
      ..where((table) => table.progressDate.equals(progressDate))
      ..where(
        (table) => ownerUserId == null
            ? table.ownerUserId.isNull()
            : table.ownerUserId.equals(ownerUserId),
      )
      ..orderBy([(table) => OrderingTerm.desc(table.updatedAt)])
      ..limit(1);

    final row = await query.getSingleOrNull();
    if (row == null) {
      return null;
    }

    return AdhkarProgressEntity(
      id: row.id,
      itemKey: row.itemKey,
      progressDate: row.progressDate,
      currentCount: row.currentCount,
      isCompleted: row.isCompleted,
      ownerUserId: row.ownerUserId,
    );
  }

  DateTime _dateOnly(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }
}
