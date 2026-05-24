import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/core/localization/app_localizations.dart';
import 'package:rafeeq_alquran/core/theme/app_theme.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/quran_audio_metadata.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/quran_chapter.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/quran_tafsir.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/quran_verse.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/reading_position.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/provider/quran_content_provider.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/repository/quran_content_repository.dart';
import 'package:rafeeq_alquran/features/quran_content/ui/pages/quran_page.dart';
import 'package:rafeeq_alquran/features/quran_content/ui/pages/surah_reading_page.dart';
import 'package:rafeeq_alquran/features/tafsir/logic/entity/tafsir_entry.dart';
import 'package:rafeeq_alquran/features/tafsir/logic/entity/tafsir_level.dart';
import 'package:rafeeq_alquran/features/tafsir/logic/entity/tafsir_resource.dart';
import 'package:rafeeq_alquran/features/tafsir/logic/provider/tafsir_provider.dart';
import 'package:rafeeq_alquran/features/tafsir/logic/repository/tafsir_repository.dart';

void main() {
  testWidgets('Quran page shows cached surah list', (tester) async {
    await tester.pumpWidget(
      _TestApp(
        repository: _FakeQuranRepository(),
        child: const QuranPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Surahs'), findsOneWidget);
    expect(find.text('Al-Fatihah'), findsOneWidget);
    expect(find.text('7 verses'), findsOneWidget);
  });

  testWidgets('Surah reading page renders readable ayah text', (tester) async {
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
}

class _TestApp extends StatelessWidget {
  const _TestApp({
    required this.repository,
    required this.child,
  });

  final QuranContentRepository repository;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        quranContentRepositoryProvider.overrideWithValue(repository),
        tafsirRepositoryProvider.overrideWithValue(_FakeTafsirRepository()),
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
  }) async {
    return const [];
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
