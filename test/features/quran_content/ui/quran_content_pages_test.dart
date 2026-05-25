import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/core/localization/app_localizations.dart';
import 'package:rafeeq_alquran/core/theme/app_theme.dart';
import 'package:rafeeq_alquran/features/favorites/logic/entity/favorite_entry.dart';
import 'package:rafeeq_alquran/features/favorites/logic/entity/favorite_type.dart';
import 'package:rafeeq_alquran/features/favorites/logic/entity/reading_bookmark.dart';
import 'package:rafeeq_alquran/features/favorites/logic/provider/favorites_provider.dart';
import 'package:rafeeq_alquran/features/favorites/logic/repository/favorites_repository.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/quran_audio_metadata.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/quran_chapter.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/quran_tafsir.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/quran_verse.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/reading_position.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/reciter.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/provider/quran_audio_playback_provider.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/provider/quran_content_provider.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/repository/quran_content_repository.dart';
import 'package:rafeeq_alquran/features/quran_content/ui/pages/quran_page.dart';
import 'package:rafeeq_alquran/features/quran_content/ui/pages/surah_reading_page.dart';
import 'package:rafeeq_alquran/features/reflection_notes/logic/entity/reflection_note.dart';
import 'package:rafeeq_alquran/features/reflection_notes/logic/entity/reflection_note_source_type.dart';
import 'package:rafeeq_alquran/features/reflection_notes/logic/provider/reflection_notes_provider.dart';
import 'package:rafeeq_alquran/features/reflection_notes/logic/repository/reflection_notes_repository.dart';
import 'package:rafeeq_alquran/features/tafsir/logic/entity/tafsir_entry.dart';
import 'package:rafeeq_alquran/features/tafsir/logic/entity/tafsir_level.dart';
import 'package:rafeeq_alquran/features/tafsir/logic/entity/tafsir_resource.dart';
import 'package:rafeeq_alquran/features/tafsir/logic/provider/tafsir_provider.dart';
import 'package:rafeeq_alquran/features/tafsir/logic/repository/tafsir_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Quran page shows cached surah list', (tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(
      _TestApp(repository: _FakeQuranRepository(), child: const QuranPage()),
    );
    await tester.pumpAndSettle();

    expect(find.text('Surahs'), findsOneWidget);
    expect(find.text('Al-Fatihah'), findsOneWidget);
    expect(find.text('7 verses'), findsOneWidget);
  });

  testWidgets('Surah reading page renders readable ayah text', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final repository = _FakeQuranRepository();

    await tester.pumpWidget(
      _TestApp(
        repository: repository,
        child: const SurahReadingPage(chapterNumber: 1),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Sample placeholder text'), findsOneWidget);
    expect(find.text('1:1'), findsOneWidget);
    expect(repository.savedPosition?.verseKey, '1:1');
  });

  testWidgets('Surah reading page hides translation when setting is off', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({
      'settings.show_translations': false,
    });
    final repository = _FakeQuranRepository();

    await tester.pumpWidget(
      _TestApp(
        repository: repository,
        child: const SurahReadingPage(chapterNumber: 1),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Sample translation'), findsNothing);
    expect(find.text('Sample placeholder text'), findsOneWidget);
  });

  testWidgets('Ayah audio button toggles between play and pause', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({});
    final repository = _FakeQuranRepository();
    final audioService = _FakeAudioPlaybackService();

    await tester.pumpWidget(
      _TestApp(
        repository: repository,
        audioService: audioService,
        child: const SurahReadingPage(chapterNumber: 1),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byTooltip('Play recitation'), findsOneWidget);

    await tester.tap(find.byTooltip('Play recitation'));
    await tester.pump();
    await tester.pump();

    expect(audioService.playedUrl, 'https://approved.example/audio/1-1.mp3');
    expect(find.byTooltip('Pause recitation'), findsOneWidget);

    await tester.tap(find.byTooltip('Pause recitation'));
    await tester.pump();

    expect(audioService.pauseCount, 1);
    expect(find.byTooltip('Play recitation'), findsOneWidget);
  });
}

class _TestApp extends StatelessWidget {
  const _TestApp({
    required this.repository,
    required this.child,
    this.audioService,
  });

  final QuranContentRepository repository;
  final Widget child;
  final QuranAudioPlaybackService? audioService;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        quranContentRepositoryProvider.overrideWithValue(repository),
        if (audioService != null)
          quranAudioPlaybackServiceProvider.overrideWithValue(audioService!),
        tafsirRepositoryProvider.overrideWithValue(_FakeTafsirRepository()),
        favoritesRepositoryProvider.overrideWithValue(
          _FakeFavoritesRepository(),
        ),
        reflectionNotesRepositoryProvider.overrideWithValue(
          _FakeReflectionNotesRepository(),
        ),
      ],
      child: MaterialApp(
        locale: const Locale('en'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        theme: AppTheme.light,
        home: child,
      ),
    );
  }
}

class _FakeFavoritesRepository implements FavoritesRepository {
  @override
  Future<FavoriteEntry> addFavorite({
    required FavoriteType type,
    required String itemKey,
    String? label,
  }) async {
    return _entry(type: type, itemKey: itemKey, label: label);
  }

  @override
  Future<List<FavoriteEntry>> getFavorites({FavoriteType? type}) async {
    return const [];
  }

  @override
  Future<bool> isFavorite({
    required FavoriteType type,
    required String itemKey,
  }) async {
    return false;
  }

  @override
  Future<FavoriteEntry?> removeFavorite({
    required FavoriteType type,
    required String itemKey,
  }) async {
    return null;
  }

  @override
  Future<ReadingBookmark> saveReadingBookmark({
    required String verseKey,
    String? label,
  }) async {
    return ReadingBookmark(
      verseKey: verseKey,
      label: label,
      savedAt: DateTime(2026, 5, 25),
    );
  }

  @override
  Future<bool> toggleFavorite({
    required FavoriteType type,
    required String itemKey,
    String? label,
  }) async {
    return true;
  }
}

FavoriteEntry _entry({
  required FavoriteType type,
  required String itemKey,
  String? label,
}) {
  return FavoriteEntry(
    id: 1,
    type: type,
    itemKey: itemKey,
    label: label,
    syncStatus: 'local',
    createdAt: DateTime(2026, 5, 25),
    updatedAt: DateTime(2026, 5, 25),
  );
}

class _FakeReflectionNotesRepository implements ReflectionNotesRepository {
  @override
  Future<ReflectionNote> addNote({
    required String verseKey,
    required ReflectionNoteSourceType sourceType,
    required String body,
    String? title,
  }) async {
    return ReflectionNote(
      id: 1,
      verseKey: verseKey,
      sourceType: sourceType,
      title: title,
      body: body,
      syncStatus: 'local',
      createdAt: DateTime(2026, 5, 25),
      updatedAt: DateTime(2026, 5, 25),
    );
  }

  @override
  Future<ReflectionNote?> deleteNote(int id) async => null;

  @override
  Future<List<ReflectionNote>> getNotesForVerse(String verseKey) async {
    return const [];
  }

  @override
  Future<ReflectionNote?> updateNote({
    required int id,
    required String body,
    String? title,
  }) async {
    return null;
  }
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
  Future<List<TafsirResource>> getResources() async {
    return const [
      TafsirResource(
        id: 'short-unavailable',
        name: 'Short meaning',
        level: TafsirLevel.shortMeaning,
        isAvailable: false,
        source: 'unavailable',
      ),
      TafsirResource(
        id: 'verified-resource',
        name: 'Al-Muyassar',
        level: TafsirLevel.alMuyassar,
        isAvailable: true,
        source: 'verified-test-source',
      ),
      TafsirResource(
        id: 'full-unavailable',
        name: 'Full tafsir',
        level: TafsirLevel.full,
        isAvailable: false,
        source: 'unavailable',
      ),
    ];
  }
}

class _FakeQuranRepository implements QuranContentRepository {
  ReadingPosition? savedPosition;

  @override
  Future<List<QuranChapter>> getChapters({bool forceRefresh = false}) async {
    return const [
      QuranChapter(
        chapterNumber: 1,
        versesCount: 7,
        source: 'verified-test-source',
        nameArabic: 'الفاتحة',
        nameEnglish: 'Al-Fatihah',
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
        textArabic: 'Sample placeholder text',
        translationText: 'Sample translation',
        source: 'verified-test-source',
      ),
    ];
  }

  @override
  Future<ReadingPosition?> getLastReadPosition() async => null;

  @override
  Future<void> saveLastReadPosition(ReadingPosition position) async {
    savedPosition = position;
  }

  @override
  Future<List<QuranVerse>> getVersesByJuz(int juzNumber) async => const [];

  @override
  Future<List<QuranVerse>> getVersesByPage(int pageNumber) async => const [];

  @override
  Future<List<QuranAudioMetadata>> getRecitationMetadata({
    required String reciterId,
    String? verseKey,
    bool forceRefresh = false,
  }) async {
    return const [
      QuranAudioMetadata(
        reciterId: 'approved-reciter',
        verseKey: '1:1',
        remoteUrl: 'https://approved.example/audio/1-1.mp3',
        source: 'verified-test-source',
      ),
    ];
  }

  @override
  Future<List<Reciter>> getReciters({bool forceRefresh = false}) async {
    return const [
      Reciter(
        id: 'approved-reciter',
        nameEnglish: 'Approved reciter',
        source: 'verified-test-source',
      ),
    ];
  }

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
}

class _FakeAudioPlaybackService implements QuranAudioPlaybackService {
  String? playedUrl;
  int pauseCount = 0;

  @override
  Future<void> play(String url) async {
    playedUrl = url;
  }

  @override
  Future<void> pause() async {
    pauseCount += 1;
  }

  @override
  Future<void> dispose() async {}
}
