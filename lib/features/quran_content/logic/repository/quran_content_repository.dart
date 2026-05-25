import '../entity/quran_audio_metadata.dart';
import '../entity/quran_chapter.dart';
import '../entity/quran_tafsir.dart';
import '../entity/quran_verse.dart';
import '../entity/reading_position.dart';
import '../entity/reciter.dart';

abstract class QuranContentRepository {
  Future<List<QuranChapter>> getChapters({bool forceRefresh = false});

  Future<List<QuranVerse>> getVersesByChapter(
    int chapterNumber, {
    bool forceRefresh = false,
  });

  Future<List<QuranVerse>> getVersesByPage(int pageNumber);

  Future<List<QuranVerse>> getVersesByJuz(int juzNumber);

  Future<QuranTafsir> getTafsir({
    required String verseKey,
    required String resourceId,
  });

  Future<List<Reciter>> getReciters({bool forceRefresh = false});

  Future<List<QuranAudioMetadata>> getRecitationMetadata({
    required String reciterId,
    String? verseKey,
    bool forceRefresh = false,
  });

  Future<void> saveLastReadPosition(ReadingPosition position);

  Future<ReadingPosition?> getLastReadPosition();
}
