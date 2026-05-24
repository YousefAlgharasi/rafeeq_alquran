import '../../../logic/entity/quran_audio_metadata.dart';
import '../../../logic/entity/quran_chapter.dart';
import '../../../logic/entity/quran_tafsir.dart';
import '../../../logic/entity/quran_verse.dart';
import '../../../logic/entity/reading_position.dart';
import '../../../logic/repository/quran_content_repository.dart';
import '../../datasources/quran_content_datasource.dart';
import '../../datasources/quran_local_datasource.dart';

class QuranContentRepositoryImpl implements QuranContentRepository {
  const QuranContentRepositoryImpl({
    required QuranContentRemoteDatasource remoteDatasource,
    required QuranContentLocalDatasource localDatasource,
  })  : _remoteDatasource = remoteDatasource,
        _localDatasource = localDatasource;

  final QuranContentRemoteDatasource _remoteDatasource;
  final QuranContentLocalDatasource _localDatasource;

  @override
  Future<List<QuranChapter>> getChapters({bool forceRefresh = false}) async {
    final cached = await _localDatasource.getCachedChapters();
    if (cached.isNotEmpty && !forceRefresh) {
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
    if (cached.isNotEmpty && !forceRefresh) {
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
  Future<List<QuranAudioMetadata>> getRecitationMetadata({
    required String reciterId,
    String? verseKey,
  }) {
    return _remoteDatasource.getRecitationMetadata(
      reciterId: reciterId,
      verseKey: verseKey,
    );
  }

  @override
  Future<void> saveLastReadPosition(ReadingPosition position) {
    return _localDatasource.saveLastReadPosition(position);
  }

  @override
  Future<ReadingPosition?> getLastReadPosition() {
    return _localDatasource.getLastReadPosition();
  }
}
