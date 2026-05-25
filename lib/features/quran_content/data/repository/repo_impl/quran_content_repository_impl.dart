import '../../../logic/entity/quran_audio_metadata.dart';
import '../../../logic/entity/quran_chapter.dart';
import '../../../logic/entity/quran_tafsir.dart';
import '../../../logic/entity/quran_verse.dart';
import '../../../logic/entity/reading_position.dart';
import '../../../logic/entity/reciter.dart';
import '../../../logic/repository/quran_content_repository.dart';
import '../../datasources/quran_content_datasource.dart';
import '../../datasources/quran_local_datasource.dart';

class QuranContentRepositoryImpl implements QuranContentRepository {
  const QuranContentRepositoryImpl({
    required QuranContentRemoteDatasource remoteDatasource,
    required QuranContentLocalDatasource localDatasource,
  }) : _remoteDatasource = remoteDatasource,
       _localDatasource = localDatasource;

  final QuranContentRemoteDatasource _remoteDatasource;
  final QuranContentLocalDatasource _localDatasource;

  @override
  Future<List<QuranChapter>> getChapters({bool forceRefresh = false}) async {
    final cached = await _localDatasource.getCachedChapters();
    if (_hasCompleteChapterCache(cached) && !forceRefresh) {
      return cached;
    }

    try {
      final remote = await _remoteDatasource.getChapters();
      if (remote.isNotEmpty) {
        await _localDatasource.cacheChapters(remote);
        return remote;
      }
    } catch (_) {
      if (cached.isNotEmpty) {
        return cached;
      }
      rethrow;
    }

    return cached;
  }

  @override
  Future<List<QuranVerse>> getVersesByChapter(
    int chapterNumber, {
    bool forceRefresh = false,
  }) async {
    final cached = await _localDatasource.getCachedVersesByChapter(
      chapterNumber,
    );
    final cachedChapters = await _localDatasource.getCachedChapters();
    final expectedVerseCount = _expectedVerseCount(
      chapters: cachedChapters,
      chapterNumber: chapterNumber,
    );
    if (_hasCompleteVerseCache(
          cached,
          expectedVerseCount: expectedVerseCount,
        ) &&
        !forceRefresh) {
      return cached;
    }

    try {
      final remote = await _remoteDatasource.getVersesByChapter(chapterNumber);
      if (remote.isNotEmpty) {
        await _localDatasource.cacheVerses(remote);
        return remote;
      }
    } catch (_) {
      if (cached.isNotEmpty) {
        return cached;
      }
      rethrow;
    }

    return cached;
  }

  @override
  Future<List<QuranVerse>> getVersesByPage(int pageNumber) {
    return _remoteDatasource.getVersesByPage(pageNumber);
  }

  @override
  Future<List<QuranVerse>> getVersesByJuz(int juzNumber) {
    return _remoteDatasource.getVersesByJuz(juzNumber);
  }

  @override
  Future<QuranTafsir> getTafsir({
    required String verseKey,
    required String resourceId,
  }) {
    return _remoteDatasource.getTafsir(
      verseKey: verseKey,
      resourceId: resourceId,
    );
  }

  @override
  Future<List<Reciter>> getReciters({bool forceRefresh = false}) async {
    final cached = await _localDatasource.getCachedReciters();
    if (cached.isNotEmpty && !forceRefresh) {
      return cached;
    }

    try {
      final remote = await _remoteDatasource.getReciters();
      if (remote.isNotEmpty) {
        await _localDatasource.cacheReciters(remote);
        return remote;
      }
    } catch (_) {
      if (cached.isNotEmpty) {
        return cached;
      }
      rethrow;
    }

    return cached;
  }

  @override
  Future<List<QuranAudioMetadata>> getRecitationMetadata({
    required String reciterId,
    String? verseKey,
    bool forceRefresh = false,
  }) async {
    final cached = await _localDatasource.getCachedRecitationMetadata(
      reciterId: reciterId,
      verseKey: verseKey,
    );
    if (cached.isNotEmpty && !forceRefresh) {
      return cached;
    }

    try {
      final remote = await _remoteDatasource.getRecitationMetadata(
        reciterId: reciterId,
        verseKey: verseKey,
      );
      if (remote.isNotEmpty) {
        await _localDatasource.cacheRecitationMetadata(remote);
        return remote;
      }
    } catch (_) {
      if (cached.isNotEmpty) {
        return cached;
      }
      rethrow;
    }

    return cached;
  }

  @override
  Future<void> saveLastReadPosition(ReadingPosition position) {
    return _localDatasource.saveLastReadPosition(position);
  }

  @override
  Future<ReadingPosition?> getLastReadPosition() {
    return _localDatasource.getLastReadPosition();
  }

  bool _hasCompleteChapterCache(List<QuranChapter> chapters) {
    return chapters.length >= 114;
  }

  int? _expectedVerseCount({
    required List<QuranChapter> chapters,
    required int chapterNumber,
  }) {
    for (final chapter in chapters) {
      if (chapter.chapterNumber == chapterNumber && chapter.versesCount > 0) {
        return chapter.versesCount;
      }
    }
    return null;
  }

  bool _hasCompleteVerseCache(
    List<QuranVerse> verses, {
    required int? expectedVerseCount,
  }) {
    if (verses.isEmpty) {
      return false;
    }
    if (expectedVerseCount == null || expectedVerseCount <= 0) {
      return false;
    }
    return verses.length >= expectedVerseCount;
  }
}
