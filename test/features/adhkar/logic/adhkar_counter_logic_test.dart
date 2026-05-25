import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/core/database/app_database.dart';
import 'package:rafeeq_alquran/features/adhkar/data/datasources/adhkar_local_datasource.dart';
import 'package:rafeeq_alquran/features/adhkar/logic/entity/adhkar_category_entity.dart';
import 'package:rafeeq_alquran/features/adhkar/logic/entity/adhkar_collection.dart';
import 'package:rafeeq_alquran/features/adhkar/logic/entity/adhkar_item_entity.dart';

void main() {
  late AppDatabase database;
  late DriftAdhkarLocalDatasource datasource;
  late AdhkarItemEntity item;

  setUp(() async {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    datasource = DriftAdhkarLocalDatasource(database);
    item = const AdhkarItemEntity(
      key: 'sample_item',
      categoryKey: 'morning',
      textArabic: 'نص تجريبي',
      textEnglish: 'Sample text',
      repeatCount: 2,
      source: 'verified-source-placeholder',
      sourceReference: 'sample-reference',
    );

    await datasource.importCollection(
      AdhkarCollection(
        schemaVersion: 1,
        contentStatus: 'placeholder',
        reviewRequired: true,
        reviewNote: 'Sample test data only.',
        categories: [
          AdhkarCategoryEntity(
            key: 'morning',
            titleArabic: 'تصنيف تجريبي',
            titleEnglish: 'Sample category',
            source: 'verified-source-placeholder',
            items: [item],
          ),
        ],
      ),
    );
  });

  tearDown(() async {
    await database.close();
  });

  test('increments counter and clamps at required repeat count', () async {
    final date = DateTime(2026, 5, 24, 13);

    final first = await datasource.incrementCounter(item: item, date: date);
    final second = await datasource.incrementCounter(item: item, date: date);
    final third = await datasource.incrementCounter(item: item, date: date);

    expect(first.currentCount, 1);
    expect(second.currentCount, 2);
    expect(second.isCompleted, isTrue);
    expect(third.currentCount, 2);
    expect(third.isCompleted, isTrue);
  });

  test('uses the local date as the daily reset boundary', () async {
    await datasource.incrementCounter(
      item: item,
      date: DateTime(2026, 5, 24, 23),
    );

    final nextDay = await datasource.getProgressForCategory(
      categoryKey: 'morning',
      date: DateTime(2026, 5, 25, 1),
    );

    expect(nextDay.single.currentCount, 0);
    expect(nextDay.single.isCompleted, isFalse);
    expect(nextDay.single.counterText, '0 / 2');
  });
}
