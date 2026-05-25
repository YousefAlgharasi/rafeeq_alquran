import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/core/localization/app_localizations.dart';
import 'package:rafeeq_alquran/core/notifications/local_notification_service.dart';
import 'package:rafeeq_alquran/core/theme/app_theme.dart';
import 'package:rafeeq_alquran/features/daily_ayah/logic/entity/daily_ayah.dart';
import 'package:rafeeq_alquran/features/daily_ayah/logic/provider/daily_ayah_provider.dart';
import 'package:rafeeq_alquran/features/daily_ayah/logic/repository/daily_ayah_repository.dart';
import 'package:rafeeq_alquran/features/daily_goal/logic/entity/daily_reading_goal.dart';
import 'package:rafeeq_alquran/features/daily_goal/logic/entity/reading_goal_type.dart';
import 'package:rafeeq_alquran/features/favorites/logic/entity/favorite_entry.dart';
import 'package:rafeeq_alquran/features/favorites/logic/entity/favorite_type.dart';
import 'package:rafeeq_alquran/features/favorites/logic/entity/reading_bookmark.dart';
import 'package:rafeeq_alquran/features/favorites/logic/provider/favorites_provider.dart';
import 'package:rafeeq_alquran/features/favorites/logic/repository/favorites_repository.dart';
import 'package:rafeeq_alquran/features/home/ui/pages/home_page.dart';
import 'package:rafeeq_alquran/features/prayer_times/logic/entity/next_prayer.dart';
import 'package:rafeeq_alquran/features/prayer_times/logic/entity/prayer_day.dart';
import 'package:rafeeq_alquran/features/prayer_times/logic/entity/prayer_name.dart';
import 'package:rafeeq_alquran/features/prayer_times/logic/entity/prayer_settings.dart';
import 'package:rafeeq_alquran/features/prayer_times/logic/entity/prayer_time.dart';
import 'package:rafeeq_alquran/features/prayer_times/logic/provider/prayer_times_provider.dart';
import 'package:rafeeq_alquran/features/prayer_times/logic/repository/prayer_times_repository.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/quran_verse.dart';
import 'package:rafeeq_alquran/features/quran_reminders/logic/entity/quran_reminder_settings.dart';
import 'package:rafeeq_alquran/features/quran_reminders/logic/entity/quran_reminder_slot.dart';
import 'package:rafeeq_alquran/features/quran_reminders/logic/provider/quran_reminder_provider.dart';
import 'package:rafeeq_alquran/features/quran_reminders/logic/repository/quran_reminder_repository.dart';
import 'package:rafeeq_alquran/features/reading_tracker/logic/entity/reading_progress_summary.dart';
import 'package:rafeeq_alquran/features/reading_tracker/logic/entity/reading_session.dart';
import 'package:rafeeq_alquran/features/reading_tracker/logic/provider/reading_tracker_provider.dart';
import 'package:rafeeq_alquran/features/reading_tracker/logic/repository/reading_tracker_repository.dart';
import 'package:rafeeq_alquran/features/streak/logic/entity/reading_streak.dart';

void main() {
  testWidgets('home dashboard shows loading state', (tester) async {
    final pendingAyah = Completer<DailyAyah>();
    final pendingProgress = Completer<ReadingProgressSummary>();
    final pendingPrayerDay = Completer<PrayerDay>();
    final pendingNextPrayer = Completer<NextPrayer?>();

    await tester.pumpWidget(
      _TestApp(
        overrides: [
          dailyAyahProvider.overrideWith((ref) => pendingAyah.future),
          readingProgressSummaryProvider.overrideWith(
            (ref) => pendingProgress.future,
          ),
          todayPrayerTimesProvider.overrideWith(
            (ref) => pendingPrayerDay.future,
          ),
          nextPrayerProvider.overrideWith((ref) => pendingNextPrayer.future),
        ],
      ),
    );
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsWidgets);
    expect(find.text('Adhkar shortcuts'), findsOneWidget);
  });

  testWidgets('home dashboard shows loaded prayer, ayah, goal, and shortcuts', (
    tester,
  ) async {
    await tester.pumpWidget(const _TestApp());
    await tester.pumpAndSettle();

    expect(find.text('Next prayer'), findsOneWidget);
    expect(find.textContaining('Dhuhr'), findsWidgets);
    expect(find.text("Today's prayer times"), findsOneWidget);
    expect(find.text("Today's ayah"), findsOneWidget);
    expect(find.text('Verified dashboard ayah'), findsOneWidget);
    expect(find.text('Mark as read'), findsOneWidget);
    expect(find.byTooltip('Tafsir'), findsOneWidget);
    expect(find.byTooltip('Play recitation'), findsOneWidget);
    expect(find.byTooltip('Share ayah as image'), findsOneWidget);
    expect(find.byTooltip('Add to favorites'), findsOneWidget);
    expect(find.textContaining('Five ayahs per day'), findsOneWidget);
    expect(find.textContaining('Current streak: 3'), findsOneWidget);
    expect(find.text('Morning'), findsOneWidget);
    expect(find.text('Offline ready'), findsOneWidget);
  });

  testWidgets('home dashboard shows offline cache limited state', (
    tester,
  ) async {
    await tester.pumpWidget(
      _TestApp(
        overrides: [
          dailyAyahProvider.overrideWith(
            (ref) => Future<DailyAyah>.error(StateError('No cache')),
          ),
        ],
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Cache limited'), findsOneWidget);
    expect(find.textContaining('Daily ayah is not available'), findsOneWidget);
    expect(find.text("Today's prayer times"), findsOneWidget);
  });
}

class _TestApp extends StatelessWidget {
  const _TestApp({this.overrides = const []});

  final List<dynamic> overrides;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        dailyAyahRepositoryProvider.overrideWithValue(
          _FakeDailyAyahRepository(),
        ),
        readingTrackerRepositoryProvider.overrideWithValue(
          _FakeReadingTrackerRepository(),
        ),
        prayerTimesRepositoryProvider.overrideWithValue(
          _FakePrayerTimesRepository(),
        ),
        quranReminderRepositoryProvider.overrideWithValue(
          _FakeQuranReminderRepository(),
        ),
        favoritesRepositoryProvider.overrideWithValue(
          _FakeFavoritesRepository(),
        ),
        ...overrides,
      ],
      child: MaterialApp(
        locale: const Locale('en'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        theme: AppTheme.light,
        home: const HomePage(),
      ),
    );
  }
}

class _FakeDailyAyahRepository implements DailyAyahRepository {
  @override
  Future<DailyAyah> getDailyAyah({
    DateTime? date,
    bool forceRefresh = false,
  }) async {
    return DailyAyah(
      selectedDate: date ?? DateTime(2026, 5, 25),
      wasRead: false,
      verse: const QuranVerse(
        verseKey: '1:1',
        chapterNumber: 1,
        verseNumber: 1,
        source: 'verified-test-source',
        textArabic: 'Verified dashboard ayah',
      ),
    );
  }

  @override
  Future<void> markAsRead({DateTime? date}) async {}
}

class _FakeReadingTrackerRepository implements ReadingTrackerRepository {
  @override
  Future<ReadingProgressSummary> getSummary({DateTime? date}) async {
    return ReadingProgressSummary(
      todayGoal: DailyReadingGoal(
        goalDate: DateTime(2026, 5, 25),
        goalType: ReadingGoalType.fiveAyahsPerDay,
        targetVerses: 5,
        completedVerses: 2,
        targetPages: 0,
        completedPages: 0,
        targetMinutes: 0,
        completedMinutes: 0,
        isCompleted: false,
      ),
      streak: const ReadingStreak(
        currentStreak: 3,
        longestStreak: 5,
        missedDays: 1,
      ),
    );
  }

  @override
  Future<ReadingGoalType> getGoalType() async =>
      ReadingGoalType.fiveAyahsPerDay;

  @override
  Future<void> recordSession(ReadingSession session) async {}

  @override
  Future<void> setGoalType(ReadingGoalType goalType) async {}
}

class _FakePrayerTimesRepository implements PrayerTimesRepository {
  @override
  Future<PrayerSettings> getSettings() async => PrayerSettings.defaults();

  @override
  Future<PrayerDay> getPrayerDay({
    DateTime? date,
    bool forceRefresh = false,
  }) async {
    final day = date ?? DateTime(2026, 5, 25);
    return PrayerDay(
      date: day,
      locationLabel: 'Sanaa, Yemen',
      source: 'test-source',
      prayers: [
        PrayerTime(name: PrayerName.fajr, time: DateTime(2026, 5, 25, 4, 30)),
        PrayerTime(name: PrayerName.dhuhr, time: DateTime(2026, 5, 25, 12, 5)),
        PrayerTime(name: PrayerName.asr, time: DateTime(2026, 5, 25, 15, 20)),
        PrayerTime(
          name: PrayerName.maghrib,
          time: DateTime(2026, 5, 25, 18, 30),
        ),
        PrayerTime(name: PrayerName.isha, time: DateTime(2026, 5, 25, 20)),
      ],
    );
  }

  @override
  Future<void> saveSettings(PrayerSettings settings) async {}

  @override
  Future<PrayerSettings> useCurrentLocation() async =>
      PrayerSettings.defaults();
}

class _FakeQuranReminderRepository implements QuranReminderRepository {
  @override
  Future<QuranReminderSettings> getSettings() async {
    return QuranReminderSettings.defaults();
  }

  @override
  Future<int> refreshSchedules({
    required bool isDailyGoalCompleted,
    required LocalNotificationContent content,
    DateTime? now,
  }) async {
    return 4;
  }

  @override
  Future<QuranReminderSettings> setEnabled(bool isEnabled) async {
    return QuranReminderSettings.defaults().copyWith(isEnabled: isEnabled);
  }

  @override
  Future<QuranReminderSettings> updateSlot(QuranReminderSlot slot) async {
    return QuranReminderSettings.defaults();
  }
}

class _FakeFavoritesRepository implements FavoritesRepository {
  final Set<String> savedKeys = {};

  @override
  Future<FavoriteEntry> addFavorite({
    required FavoriteType type,
    required String itemKey,
    String? label,
  }) async {
    savedKeys.add('${type.value}:$itemKey');
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
    return savedKeys.contains('${type.value}:$itemKey');
  }

  @override
  Future<FavoriteEntry?> removeFavorite({
    required FavoriteType type,
    required String itemKey,
  }) async {
    savedKeys.remove('${type.value}:$itemKey');
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
    final key = '${type.value}:$itemKey';
    if (savedKeys.contains(key)) {
      savedKeys.remove(key);
      return false;
    }
    savedKeys.add(key);
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
