import '../../../../quran_content/logic/entity/quran_audio_metadata.dart';
import '../../../../quran_content/logic/entity/quran_chapter.dart';
import '../../../../quran_content/logic/entity/quran_verse.dart';
import '../../../../quran_content/logic/repository/quran_content_repository.dart';
import '../../../../tafsir/logic/entity/tafsir_entry.dart';
import '../../../../tafsir/logic/repository/tafsir_repository.dart';
import '../../../logic/daily_ayah_selector.dart';
import '../../../logic/entity/daily_ayah.dart';
import '../../../logic/repository/daily_ayah_repository.dart';
import '../../datasources/daily_ayah_local_datasource.dart';
import '../../models/daily_ayah_model.dart';

class DailyAyahRepositoryImpl implements DailyAyahRepository {
  const DailyAyahRepositoryImpl({
    required DailyAyahLocalDatasource localDatasource,
    required QuranContentRepository quranRepository,
    required TafsirRepository tafsirRepository,
    DailyAyahSelector selector = const DailyAyahSelector(),
  })  : _localDatasource = localDatasource,
        _quranRepository = quranRepository,
        _tafsirRepository = tafsirRepository,
        _selector = selector;

  final DailyAyahLocalDatasource _localDatasource;
  final QuranContentRepository _quranRepository;
  final TafsirRepository _tafsirRepository;
  final DailyAyahSelector _selector;

  @override
  Future<DailyAyah> getDailyAyah({
    DateTime? date,
    bool forceRefresh = false,
  }) async {
    final selectedDate = _dateOnly(date ?? DateTime.now());
    var history = forceRefresh
        ? null
        : await _localDatasource.getEntryForDate(selectedDate);

    QuranVerse verse;
    if (history == null) {
      verse = await _selectAvailableVerse(selectedDate);
      history = await _saveSelection(
        selectedDate: selectedDate,
        verse: verse,
        wasRead: false,
      );
    } else {
      try {
        verse = await _loadVerse(history.verseKey);
      } catch (_) {
        verse = await _selectAvailableVerse(selectedDate);
        history = await _saveSelection(
          selectedDate: selectedDate,
          verse: verse,
          wasRead: false,
        );
      }
    }

    final tafsir = await _loadTafsir(verse.verseKey);
    final audio = await _loadAudioMetadata(verse.verseKey);

    return DailyAyahModel.fromParts(
      selectedDate: selectedDate,
      verse: verse,
      tafsir: tafsir,
      audioMetadata: audio,
      wasRead: history.wasRead,
    );
  }

  @override
  Future<void> markAsRead({DateTime? date}) {
    return _localDatasource.markAsRead(_dateOnly(date ?? DateTime.now()));
  }

  Future<QuranVerse> _loadVerse(String verseKey) async {
    final parts = verseKey.split(':');
    final chapterNumber = int.tryParse(parts.first) ?? 1;
    final verses = await _quranRepository.getVersesByChapter(chapterNumber);
    return verses.firstWhere(
      (verse) => verse.verseKey == verseKey,
      orElse: () {
        throw StateError('Daily ayah $verseKey is unavailable from Quran cache.');
      },
    );
  }

  Future<QuranVerse> _selectAvailableVerse(DateTime selectedDate) async {
    final chapters = await _quranRepository.getChapters();
    final recentVerseKeys = await _localDatasource.getRecentVerseKeys(
      beforeDate: selectedDate,
    );

    if (chapters.isEmpty) {
      throw StateError('No Quran chapters are available for daily ayah.');
    }

    final startIndex = _selector.selectChapterIndex(
      date: selectedDate,
      chapterCount: chapters.length,
    );
    for (var offset = 0; offset < chapters.length; offset++) {
      final chapter = chapters[(startIndex + offset) % chapters.length];
      final verses = await _loadChapterVerses(chapter);
      if (verses.isNotEmpty) {
        return _selector.selectFromAvailableVerses(
          date: selectedDate,
          verses: verses,
          recentVerseKeys: recentVerseKeys,
        );
      }
    }

    throw StateError('No Quran verses are available for daily ayah.');
  }

  Future<List<QuranVerse>> _loadChapterVerses(QuranChapter chapter) async {
    try {
      return await _quranRepository.getVersesByChapter(chapter.chapterNumber);
    } catch (_) {
      return const [];
    }
  }

  Future<DailyAyahHistoryEntry> _saveSelection({
    required DateTime selectedDate,
    required QuranVerse verse,
    required bool wasRead,
  }) async {
    await _localDatasource.saveDailyAyah(
      selectedDate: selectedDate,
      verseKey: verse.verseKey,
      wasRead: wasRead,
    );

    return DailyAyahHistoryEntry(
      verseKey: verse.verseKey,
      selectedDate: selectedDate,
      wasRead: wasRead,
    );
  }

  Future<TafsirEntry?> _loadTafsir(String verseKey) async {
    try {
      return await _tafsirRepository.getAlMuyassarTafsir(verseKey: verseKey);
    } catch (_) {
      return null;
    }
  }

  Future<List<QuranAudioMetadata>> _loadAudioMetadata(String verseKey) async {
    try {
      final reciters = await _quranRepository.getReciters();
      if (reciters.isEmpty) {
        return const [];
      }
      return _quranRepository.getRecitationMetadata(
        reciterId: reciters.first.id,
        verseKey: verseKey,
      );
    } catch (_) {
      return const [];
    }
  }

  DateTime _dateOnly(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }
}
