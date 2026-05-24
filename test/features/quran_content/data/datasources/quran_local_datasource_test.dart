import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/core/database/app_database.dart';
import 'package:rafeeq_alquran/features/quran_content/data/datasources/quran_local_datasource.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/quran_chapter.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/quran_verse.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/reading_position.dart';

void main() {
  late AppDatabase database;
  late QuranLocalDatasource datasource;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    datasource = QuranLocalDatasource(database);
  });

  tearDown(() async {
    await database.close();
  });

  test('caches and reads chapters and verses', () async {
    await datasource.cacheChapters(
      const [
        QuranChapter(
          chapterNumber: 1,
          versesCount: 7,
          source: 'verified-test-source',
          nameEnglish: 'Al-Fatihah',
        ),
      ],
    );
    await datasource.cacheVerses(
      const [
        QuranVerse(
          verseKey: '1:1',
          chapterNumber: 1,
          verseNumber: 1,
          textArabic: 'Sample placeholder text',
          source: 'verified-test-source',
        ),
      ],
    );

    final chapters = await datasource.getCachedChapters();
    final verses = await datasource.getCachedVersesByChapter(1);

    expect(chapters.single.chapterNumber, 1);
    expect(verses.single.verseKey, '1:1');
  });

  test('saves and reads last reading position', () async {
    final position = ReadingPosition(
      verseKey: '1:1',
      chapterNumber: 1,
      verseNumber: 1,
      lastReadAt: DateTime.utc(2026, 5, 24),
    );

    await datasource.saveLastReadPosition(position);

    final cached = await datasource.getLastReadPosition();

    expect(cached?.verseKey, '1:1');
    expect(cached?.chapterNumber, 1);
  });
}
