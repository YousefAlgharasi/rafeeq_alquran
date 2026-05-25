import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/core/localization/app_localizations.dart';
import 'package:rafeeq_alquran/core/theme/app_theme.dart';
import 'package:rafeeq_alquran/features/daily_ayah/logic/entity/daily_ayah.dart';
import 'package:rafeeq_alquran/features/daily_ayah/logic/provider/daily_ayah_provider.dart';
import 'package:rafeeq_alquran/features/daily_ayah/logic/repository/daily_ayah_repository.dart';
import 'package:rafeeq_alquran/features/daily_ayah/ui/pages/daily_ayah_page.dart';
import 'package:rafeeq_alquran/features/favorites/logic/entity/favorite_entry.dart';
import 'package:rafeeq_alquran/features/favorites/logic/entity/favorite_type.dart';
import 'package:rafeeq_alquran/features/favorites/logic/entity/reading_bookmark.dart';
import 'package:rafeeq_alquran/features/favorites/logic/provider/favorites_provider.dart';
import 'package:rafeeq_alquran/features/favorites/logic/repository/favorites_repository.dart';
import 'package:rafeeq_alquran/features/home/ui/pages/home_page.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/quran_verse.dart';
import 'package:rafeeq_alquran/features/reflection_notes/logic/entity/reflection_note.dart';
import 'package:rafeeq_alquran/features/reflection_notes/logic/entity/reflection_note_source_type.dart';
import 'package:rafeeq_alquran/features/reflection_notes/logic/provider/reflection_notes_provider.dart';
import 'package:rafeeq_alquran/features/reflection_notes/logic/repository/reflection_notes_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Home page shows compact daily ayah card', (tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(
      _TestApp(repository: _FakeDailyAyahRepository(), child: const HomePage()),
    );
    await tester.pump();
    await tester.pump();

    expect(find.text("Today's ayah"), findsOneWidget);
    expect(find.text('Verified placeholder ayah'), findsOneWidget);
    expect(find.byTooltip('Play recitation'), findsOneWidget);
  });

  testWidgets('Daily ayah page marks ayah as read', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final repository = _FakeDailyAyahRepository();

    await tester.pumpWidget(
      _TestApp(repository: repository, child: const DailyAyahPage()),
    );
    await tester.pumpAndSettle();

    expect(find.text('Mark as read'), findsOneWidget);

    await tester.tap(find.text('Mark as read'));
    await tester.pumpAndSettle();

    expect(repository.markReadCount, 1);
    expect(find.text('Read'), findsOneWidget);
  });

  testWidgets('Daily ayah page hides translation when setting is off', (
    tester,
  ) async {
    SharedPreferences.setMockInitialValues({
      'settings.show_translations': false,
    });

    await tester.pumpWidget(
      _TestApp(
        repository: _FakeDailyAyahRepository(),
        child: const DailyAyahPage(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Verified placeholder ayah'), findsOneWidget);
    expect(find.text('Verified placeholder translation'), findsNothing);
  });

  testWidgets(
    'Daily ayah page shows fallback actions when ayah is unavailable',
    (tester) async {
      SharedPreferences.setMockInitialValues({});
      await tester.pumpWidget(
        _TestApp(
          repository: _FailingDailyAyahRepository(),
          child: const DailyAyahPage(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text("Today's ayah"), findsOneWidget);
      expect(
        find.textContaining('The ayah text will appear here'),
        findsOneWidget,
      );
      expect(find.text('Retry'), findsOneWidget);
      expect(find.text('Quran'), findsOneWidget);
      expect(find.text('Share ayah as image'), findsOneWidget);
    },
  );
}

class _TestApp extends StatelessWidget {
  const _TestApp({required this.repository, required this.child});

  final DailyAyahRepository repository;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        dailyAyahRepositoryProvider.overrideWithValue(repository),
        reflectionNotesRepositoryProvider.overrideWithValue(
          _FakeReflectionNotesRepository(),
        ),
        favoritesRepositoryProvider.overrideWithValue(
          _FakeFavoritesRepository(),
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
    return _entry(type: type, itemKey: itemKey);
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

class _FakeDailyAyahRepository implements DailyAyahRepository {
  bool wasRead = false;
  int markReadCount = 0;

  @override
  Future<DailyAyah> getDailyAyah({
    DateTime? date,
    bool forceRefresh = false,
  }) async {
    return DailyAyah(
      selectedDate: date ?? DateTime(2026, 5, 24),
      wasRead: wasRead,
      verse: const QuranVerse(
        verseKey: '1:1',
        chapterNumber: 1,
        verseNumber: 1,
        textArabic: 'Verified placeholder ayah',
        translationText: 'Verified placeholder translation',
        source: 'verified-test-source',
      ),
    );
  }

  @override
  Future<void> markAsRead({DateTime? date}) async {
    markReadCount += 1;
    wasRead = true;
  }
}

class _FailingDailyAyahRepository implements DailyAyahRepository {
  @override
  Future<DailyAyah> getDailyAyah({
    DateTime? date,
    bool forceRefresh = false,
  }) async {
    throw StateError('No Quran content cached.');
  }

  @override
  Future<void> markAsRead({DateTime? date}) async {}
}
