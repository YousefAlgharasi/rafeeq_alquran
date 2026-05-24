import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/core/database/app_database.dart';

void main() {
  late AppDatabase database;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
  });

  tearDown(() async {
    await database.close();
  });

  test('opens an in-memory database', () async {
    final schemaVersion = await database
        .customSelect('PRAGMA user_version')
        .getSingle();

    expect(schemaVersion.read<int>('user_version'), 1);
  });

  test('inserts and reads a Quran chapter cache record', () async {
    final now = DateTime.utc(2026, 5, 24);

    final id = await database
        .into(database.quranChaptersCache)
        .insert(
          QuranChaptersCacheCompanion.insert(
            chapterNumber: 1,
            nameArabic: 'sample-arabic-name',
            versesCount: 7,
            source: 'verified-source-placeholder',
            createdAt: now,
            updatedAt: now,
          ),
        );

    final row = await (database.select(
      database.quranChaptersCache,
    )..where((table) => table.id.equals(id))).getSingle();

    expect(row.chapterNumber, 1);
    expect(row.versesCount, 7);
    expect(row.source, 'verified-source-placeholder');
  });

  test('inserts and reads a guest reflection note', () async {
    final now = DateTime.utc(2026, 5, 24);

    final id = await database
        .into(database.reflectionNotes)
        .insert(
          ReflectionNotesCompanion.insert(
            body: 'Local guest note',
            createdAt: now,
            updatedAt: now,
          ),
        );

    final row = await (database.select(
      database.reflectionNotes,
    )..where((table) => table.id.equals(id))).getSingle();

    expect(row.ownerUserId, isNull);
    expect(row.firebaseId, isNull);
    expect(row.syncStatus, 'local');
    expect(row.deletedAt, isNull);
    expect(row.body, 'Local guest note');
  });
}
