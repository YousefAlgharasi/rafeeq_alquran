import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../logic/entity/tafsir_entry.dart';
import '../../logic/entity/tafsir_level.dart';
import '../../logic/entity/tafsir_resource.dart';

abstract class TafsirLocalDatasource {
  Future<TafsirEntry?> getCachedTafsir({
    required String verseKey,
    required TafsirResource resource,
  });

  Future<TafsirEntry?> getCachedTafsirByLevel({
    required String verseKey,
    required TafsirLevel level,
  });

  Future<void> cacheTafsir(TafsirEntry tafsir);
}

class DriftTafsirLocalDatasource implements TafsirLocalDatasource {
  const DriftTafsirLocalDatasource(this._database);

  final AppDatabase _database;

  @override
  Future<TafsirEntry?> getCachedTafsir({
    required String verseKey,
    required TafsirResource resource,
  }) async {
    final rows =
        await (_database.select(_database.tafsirCaches)
              ..where(
                (table) =>
                    table.verseKey.equals(verseKey) &
                    table.tafsirId.equals(resource.id),
              )
              ..limit(1))
            .get();

    if (rows.isEmpty) {
      return null;
    }

    final row = rows.single;
    return TafsirEntry(
      verseKey: row.verseKey,
      resourceId: row.tafsirId,
      resourceName: resource.name,
      level: resource.level,
      languageCode: row.languageCode,
      text: row.tafsirText,
      source: row.source,
    );
  }

  @override
  Future<TafsirEntry?> getCachedTafsirByLevel({
    required String verseKey,
    required TafsirLevel level,
  }) async {
    final rows =
        await (_database.select(_database.tafsirCaches)
              ..where((table) => table.verseKey.equals(verseKey))
              ..orderBy([(table) => OrderingTerm.desc(table.updatedAt)])
              ..limit(1))
            .get();

    if (rows.isEmpty) {
      return null;
    }

    final row = rows.single;
    return TafsirEntry(
      verseKey: row.verseKey,
      resourceId: row.tafsirId,
      resourceName: _resourceName(level),
      level: level,
      languageCode: row.languageCode,
      text: row.tafsirText,
      source: row.source,
    );
  }

  @override
  Future<void> cacheTafsir(TafsirEntry tafsir) async {
    final now = DateTime.now().toUtc();
    await (_database.delete(_database.tafsirCaches)..where(
          (table) =>
              table.verseKey.equals(tafsir.verseKey) &
              table.tafsirId.equals(tafsir.resourceId),
        ))
        .go();

    await _database
        .into(_database.tafsirCaches)
        .insert(
          TafsirCachesCompanion.insert(
            verseKey: tafsir.verseKey,
            tafsirId: tafsir.resourceId,
            languageCode: tafsir.languageCode,
            tafsirText: tafsir.text,
            source: tafsir.source,
            createdAt: now,
            updatedAt: now,
          ),
        );
  }

  String _resourceName(TafsirLevel level) {
    return switch (level) {
      TafsirLevel.shortMeaning => 'Short meaning',
      TafsirLevel.alMuyassar => 'Al-Muyassar',
      TafsirLevel.full => 'Full tafsir',
    };
  }
}

const unavailableTafsirResources = [
  TafsirResource(
    id: 'short-meaning-unavailable',
    name: 'Short meaning',
    level: TafsirLevel.shortMeaning,
    isAvailable: false,
    source: 'Unavailable until verified source is approved',
  ),
  TafsirResource(
    id: 'full-tafsir-unavailable',
    name: 'Full tafsir',
    level: TafsirLevel.full,
    isAvailable: false,
    source: 'Unavailable until verified source is approved',
  ),
];
