import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../logic/entity/quran_chapter.dart';
import '../../logic/entity/quran_verse.dart';
import '../../logic/entity/reading_position.dart';

abstract class QuranContentLocalDatasource {
  Future<List<QuranChapter>> getCachedChapters();

  Future<void> cacheChapters(List<QuranChapter> chapters);

  Future<List<QuranVerse>> getCachedVersesByChapter(int chapterNumber);

  Future<void> cacheVerses(List<QuranVerse> verses);

  Future<void> saveLastReadPosition(ReadingPosition position);

  Future<ReadingPosition?> getLastReadPosition();
}

class QuranLocalDatasource implements QuranContentLocalDatasource {
  const QuranLocalDatasource(this._database);

  final AppDatabase _database;

  @override
  Future<List<QuranChapter>> getCachedChapters() async {
    final rows = await (_database.select(_database.quranChaptersCache)
          ..orderBy([
            (table) => OrderingTerm.asc(table.chapterNumber),
          ]))
        .get();

    return rows.map(_chapterFromRow).toList();
  }

  @override
  Future<void> cacheChapters(List<QuranChapter> chapters) async {
    final now = DateTime.now().toUtc();
    await _database.batch((batch) {
      batch.insertAllOnConflictUpdate(
        _database.quranChaptersCache,
        chapters.map((chapter) {
          return QuranChaptersCacheCompanion.insert(
            chapterNumber: chapter.chapterNumber,
            nameArabic: chapter.nameArabic ?? chapter.chapterNumber.toString(),
            nameEnglish: Value(chapter.nameEnglish),
            versesCount: chapter.versesCount,
            source: chapter.source,
            createdAt: now,
            updatedAt: now,
          );
        }).toList(),
      );
    });
  }

  @override
  Future<List<QuranVerse>> getCachedVersesByChapter(int chapterNumber) async {
    final rows = await (_database.select(_database.quranVersesCache)
          ..where((table) => table.chapterNumber.equals(chapterNumber))
          ..orderBy([
            (table) => OrderingTerm.asc(table.verseNumber),
          ]))
        .get();

    return rows.map(_verseFromRow).toList();
  }

  @override
  Future<void> cacheVerses(List<QuranVerse> verses) async {
    final now = DateTime.now().toUtc();
    await _database.batch((batch) {
      batch.insertAllOnConflictUpdate(
        _database.quranVersesCache,
        verses.map((verse) {
          return QuranVersesCacheCompanion.insert(
            chapterNumber: verse.chapterNumber,
            verseNumber: verse.verseNumber,
            verseKey: verse.verseKey,
            textArabic: verse.textArabic,
            translationText: Value(verse.translationText),
            translationSource: Value(verse.translationSource),
            source: verse.source,
            createdAt: now,
            updatedAt: now,
          );
        }).toList(),
      );
    });
  }

  @override
  Future<void> saveLastReadPosition(ReadingPosition position) async {
    final now = DateTime.now().toUtc();
    await _database.into(_database.readingProgress).insert(
          ReadingProgressCompanion.insert(
            verseKey: position.verseKey,
            chapterNumber: position.chapterNumber,
            verseNumber: position.verseNumber,
            lastReadAt: Value(position.lastReadAt),
            createdAt: now,
            updatedAt: now,
          ),
        );
  }

  @override
  Future<ReadingPosition?> getLastReadPosition() async {
    final rows = await (_database.select(_database.readingProgress)
          ..orderBy([
            (table) => OrderingTerm.desc(table.lastReadAt),
            (table) => OrderingTerm.desc(table.updatedAt),
          ])
          ..limit(1))
        .get();

    if (rows.isEmpty) {
      return null;
    }

    final row = rows.single;
    return ReadingPosition(
      verseKey: row.verseKey,
      chapterNumber: row.chapterNumber,
      verseNumber: row.verseNumber,
      lastReadAt: row.lastReadAt ?? row.updatedAt,
    );
  }

  QuranChapter _chapterFromRow(QuranChaptersCacheData row) {
    return QuranChapter(
      chapterNumber: row.chapterNumber,
      versesCount: row.versesCount,
      source: row.source,
      nameArabic: row.nameArabic,
      nameEnglish: row.nameEnglish,
    );
  }

  QuranVerse _verseFromRow(QuranVersesCacheData row) {
    return QuranVerse(
      verseKey: row.verseKey,
      chapterNumber: row.chapterNumber,
      verseNumber: row.verseNumber,
      textArabic: row.textArabic,
      translationText: row.translationText,
      translationSource: row.translationSource,
      source: row.source,
    );
  }
}
