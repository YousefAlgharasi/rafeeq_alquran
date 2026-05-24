import '../../logic/entity/quran_audio_metadata.dart';
import '../../logic/entity/quran_chapter.dart';
import '../../logic/entity/quran_tafsir.dart';
import '../../logic/entity/quran_verse.dart';
import 'quran_content_datasource.dart';

class QuranFoundationAccessBlockedException implements Exception {
  const QuranFoundationAccessBlockedException();

  static const message =
      'Quran Foundation access is blocked until credentials are approved and a server-side proxy is configured.';

  @override
  String toString() => message;
}

class BlockedQuranFoundationDatasource implements QuranContentRemoteDatasource {
  const BlockedQuranFoundationDatasource();

  Never _blocked() {
    throw const QuranFoundationAccessBlockedException();
  }

  @override
  Future<List<QuranChapter>> getChapters() async => _blocked();

  @override
  Future<List<QuranVerse>> getVersesByChapter(int chapterNumber) async {
    return _blocked();
  }

  @override
  Future<List<QuranVerse>> getVersesByPage(int pageNumber) async {
    return _blocked();
  }

  @override
  Future<List<QuranVerse>> getVersesByJuz(int juzNumber) async {
    return _blocked();
  }

  @override
  Future<QuranTafsir> getTafsir({
    required String verseKey,
    required String resourceId,
  }) async {
    return _blocked();
  }

  @override
  Future<List<QuranAudioMetadata>> getRecitationMetadata({
    required String reciterId,
    String? verseKey,
  }) async {
    return _blocked();
  }
}
