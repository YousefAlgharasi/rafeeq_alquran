import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../logic/entity/quran_audio_metadata.dart';
import '../../logic/entity/quran_chapter.dart';
import '../../logic/entity/quran_verse.dart';
import '../../logic/entity/reading_position.dart';
import '../../logic/entity/reciter.dart';

abstract class QuranContentLocalDatasource {
  Future<List<QuranChapter>> getCachedChapters();

  Future<void> cacheChapters(List<QuranChapter> chapters);

  Future<List<QuranVerse>> getCachedVersesByChapter(int chapterNumber);

  Future<void> cacheVerses(List<QuranVerse> verses);

  Future<List<Reciter>> getCachedReciters();

  Future<void> cacheReciters(List<Reciter> reciters);

  Future<List<QuranAudioMetadata>> getCachedRecitationMetadata({
    required String reciterId,
    String? verseKey,
  });

  Future<void> cacheRecitationMetadata(List<QuranAudioMetadata> metadata);

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
  Future<List<Reciter>> getCachedReciters() async {
    final rows = await (_database.select(_database.quranRecitersCache)
          ..orderBy([
            (table) => OrderingTerm.asc(table.nameEnglish),
            (table) => OrderingTerm.asc(table.reciterId),
          ]))
        .get();

    return rows.map(_reciterFromRow).toList();
  }

  @override
  Future<void> cacheReciters(List<Reciter> reciters) async {
    final now = DateTime.now().toUtc();
    await _database.batch((batch) {
      batch.insertAllOnConflictUpdate(
        _database.quranRecitersCache,
        reciters.map((reciter) {
          return QuranRecitersCacheCompanion.insert(
            reciterId: reciter.id,
            nameArabic: Value(reciter.nameArabic),
            nameEnglish: Value(reciter.nameEnglish),
            style: Value(reciter.style),
            source: reciter.source,
            createdAt: now,
            updatedAt: now,
          );
        }).toList(),
      );
    });
  }

  @override
  Future<List<QuranAudioMetadata>> getCachedRecitationMetadata({
    required String reciterId,
    String? verseKey,
  }) async {
    final query = _database.select(_database.audioCacheMetadata)
      ..where((table) => table.reciterId.equals(reciterId));
    if (verseKey != null) {
      query.where((table) => table.verseKey.equals(verseKey));
    }
    query.orderBy([
      (table) => OrderingTerm.asc(table.verseKey),
    ]);

    final rows = await query.get();
    return rows.map(_audioMetadataFromRow).toList();
  }

  @override
  Future<void> cacheRecitationMetadata(
    List<QuranAudioMetadata> metadata,
  ) async {
    final validRows = metadata.where((item) {
      return item.remoteUrl != null && item.remoteUrl!.isNotEmpty;
    }).toList();
    if (validRows.isEmpty) {
      return;
    }

    final now = DateTime.now().toUtc();
    await _database.batch((batch) {
      batch.insertAll(
        _database.audioCacheMetadata,
        validRows.map((item) {
          return AudioCacheMetadataCompanion.insert(
            verseKey: Value(item.verseKey),
            reciterId: item.reciterId,
            remoteUrl: item.remoteUrl!,
            localPath: Value(item.localPath),
            source: item.source,
            isDownloaded: Value(item.isDownloaded),
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

  Reciter _reciterFromRow(QuranRecitersCacheData row) {
    return Reciter(
      id: row.reciterId,
      nameArabic: row.nameArabic,
      nameEnglish: row.nameEnglish,
      style: row.style,
      source: row.source,
    );
  }

  QuranAudioMetadata _audioMetadataFromRow(AudioCacheMetadataData row) {
    return QuranAudioMetadata(
      reciterId: row.reciterId,
      verseKey: row.verseKey,
      remoteUrl: row.remoteUrl,
      localPath: row.localPath,
      source: row.source,
      isDownloaded: row.isDownloaded,
    );
  }
}
