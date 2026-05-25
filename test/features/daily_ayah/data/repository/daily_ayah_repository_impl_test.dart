import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/features/daily_ayah/data/datasources/daily_ayah_local_datasource.dart';
import 'package:rafeeq_alquran/features/daily_ayah/data/repository/repo_impl/daily_ayah_repository_impl.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/quran_audio_metadata.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/quran_chapter.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/quran_tafsir.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/quran_verse.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/reading_position.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/reciter.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/repository/quran_content_repository.dart';
import 'package:rafeeq_alquran/features/tafsir/logic/entity/tafsir_entry.dart';
import 'package:rafeeq_alquran/features/tafsir/logic/entity/tafsir_level.dart';
import 'package:rafeeq_alquran/features/tafsir/logic/entity/tafsir_resource.dart';
import 'package:rafeeq_alquran/features/tafsir/logic/repository/tafsir_repository.dart';

void main() {
  test('selects and hydrates daily ayah content from approved repositories', () async {
    final local = _FakeDailyAyahLocalDatasource();
    final quran = _FakeQuranRepository();
    final tafsir = _FakeTafsirRepository();
    final repository = DailyAyahRepositoryImpl(
      localDatasource: local,
      quranRepository: quran,
      tafsirRepository: tafsir,
    );

    final dailyAyah = await repository.getDailyAyah(
      date: DateTime(2026, 5, 24),
    );

    expect(dailyAyah.selectedDate, DateTime(2026, 5, 24));
    expect(dailyAyah.verse.textArabic, 'Verified placeholder ayah 1');
    expect(dailyAyah.tafsir?.text, 'Verified tafsir placeholder');
    expect(dailyAyah.audioMetadata.single.remoteUrl, contains('approved'));
    expect(local.savedEntry?.verseKey, dailyAyah.verse.verseKey);
  });

  test('reuses the saved ayah for the same date', () async {
    final local = _FakeDailyAyahLocalDatasource(
      entry: DailyAyahHistoryEntry(
        verseKey: '1:2',
        selectedDate: DateTime(2026, 5, 24),
        wasRead: true,
      ),
    );
    final repository = DailyAyahRepositoryImpl(
      localDatasource: local,
      quranRepository: _FakeQuranRepository(),
      tafsirRepository: _FakeTafsirRepository(),
    );

    final dailyAyah = await repository.getDailyAyah(
      date: DateTime(2026, 5, 24),
    );

    expect(dailyAyah.verse.verseKey, '1:2');
    expect(dailyAyah.wasRead, isTrue);
  });

  test('reselects when saved ayah is outside available test access', () async {
    final local = _FakeDailyAyahLocalDatasource(
      entry: DailyAyahHistoryEntry(
        verseKey: '1:99',
        selectedDate: DateTime(2026, 5, 24),
        wasRead: false,
      ),
    );
    final repository = DailyAyahRepositoryImpl(
      localDatasource: local,
      quranRepository: _FakeQuranRepository(),
      tafsirRepository: _FakeTafsirRepository(),
    );

    final dailyAyah = await repository.getDailyAyah(
      date: DateTime(2026, 5, 24),
    );

    expect(['1:1', '1:2'], contains(dailyAyah.verse.verseKey));
    expect(local.savedEntry?.verseKey, dailyAyah.verse.verseKey);
  });
}

class _FakeDailyAyahLocalDatasource implements DailyAyahLocalDatasource {
  _FakeDailyAyahLocalDatasource({DailyAyahHistoryEntry? entry})
      : savedEntry = entry;

  DailyAyahHistoryEntry? savedEntry;

  @override
  Future<DailyAyahHistoryEntry?> getEntryForDate(DateTime date) async {
    return savedEntry?.selectedDate == DateTime(date.year, date.month, date.day)
        ? savedEntry
        : null;
  }

  @override
  Future<List<String>> getRecentVerseKeys({
    required DateTime beforeDate,
    int limit = 7,
  }) async {
    return const [];
  }

  @override
  Future<void> markAsRead(DateTime selectedDate) async {
    final entry = savedEntry;
    if (entry != null) {
      savedEntry = DailyAyahHistoryEntry(
        verseKey: entry.verseKey,
        selectedDate: entry.selectedDate,
        wasRead: true,
      );
    }
  }

  @override
  Future<void> saveDailyAyah({
    required DateTime selectedDate,
    required String verseKey,
    required bool wasRead,
  }) async {
    savedEntry = DailyAyahHistoryEntry(
      verseKey: verseKey,
      selectedDate: selectedDate,
      wasRead: wasRead,
    );
  }
}

class _FakeQuranRepository implements QuranContentRepository {
  @override
  Future<List<QuranChapter>> getChapters({bool forceRefresh = false}) async {
    return const [
      QuranChapter(
        chapterNumber: 1,
        versesCount: 99,
        source: 'verified-test-source',
      ),
    ];
  }

  @override
  Future<List<QuranVerse>> getVersesByChapter(
    int chapterNumber, {
    bool forceRefresh = false,
  }) async {
    return const [
      QuranVerse(
        verseKey: '1:1',
        chapterNumber: 1,
        verseNumber: 1,
        textArabic: 'Verified placeholder ayah 1',
        source: 'verified-test-source',
      ),
      QuranVerse(
        verseKey: '1:2',
        chapterNumber: 1,
        verseNumber: 2,
        textArabic: 'Verified placeholder ayah 2',
        source: 'verified-test-source',
      ),
    ];
  }

  @override
  Future<List<Reciter>> getReciters({bool forceRefresh = false}) async {
    return const [
      Reciter(id: '7', source: 'verified-test-source'),
    ];
  }

  @override
  Future<List<QuranAudioMetadata>> getRecitationMetadata({
    required String reciterId,
    String? verseKey,
    bool forceRefresh = false,
  }) async {
    return [
      QuranAudioMetadata(
        reciterId: reciterId,
        verseKey: verseKey,
        remoteUrl: 'https://approved.example/audio.mp3',
        source: 'verified-test-source',
      ),
    ];
  }

  @override
  Future<ReadingPosition?> getLastReadPosition() async => null;

  @override
  Future<QuranTafsir> getTafsir({
    required String verseKey,
    required String resourceId,
  }) async {
    return QuranTafsir(
      verseKey: verseKey,
      resourceId: resourceId,
      languageCode: 'ar',
      source: 'verified-test-source',
    );
  }

  @override
  Future<List<QuranVerse>> getVersesByJuz(int juzNumber) async => const [];

  @override
  Future<List<QuranVerse>> getVersesByPage(int pageNumber) async => const [];

  @override
  Future<void> saveLastReadPosition(ReadingPosition position) async {}
}

class _FakeTafsirRepository implements TafsirRepository {
  @override
  Future<TafsirEntry> getAlMuyassarTafsir({
    required String verseKey,
    bool forceRefresh = false,
  }) async {
    return TafsirEntry(
      verseKey: verseKey,
      resourceId: 'verified-resource',
      resourceName: 'Al-Muyassar',
      level: TafsirLevel.alMuyassar,
      languageCode: 'ar',
      text: 'Verified tafsir placeholder',
      source: 'verified-test-source',
    );
  }

  @override
  Future<List<TafsirResource>> getResources() async => const [];
}
