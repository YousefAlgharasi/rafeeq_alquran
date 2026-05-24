import '../../logic/entity/quran_audio_metadata.dart';
import '../../logic/entity/quran_chapter.dart';
import '../../logic/entity/quran_tafsir.dart';
import '../../logic/entity/quran_verse.dart';

abstract class QuranContentRemoteDatasource {
  Future<List<QuranChapter>> getChapters();

  Future<List<QuranVerse>> getVersesByChapter(int chapterNumber);

  Future<List<QuranVerse>> getVersesByPage(int pageNumber);

  Future<List<QuranVerse>> getVersesByJuz(int juzNumber);

  Future<QuranTafsir> getTafsir({
    required String verseKey,
    required String resourceId,
  });

  Future<List<QuranAudioMetadata>> getRecitationMetadata({
    required String reciterId,
    String? verseKey,
  });
}
