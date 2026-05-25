import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/core/localization/app_localizations.dart';
import 'package:rafeeq_alquran/core/notifications/local_notification_service.dart';
import 'package:rafeeq_alquran/core/theme/app_theme.dart';
import 'package:rafeeq_alquran/features/adhan_notifications/logic/entity/adhan_notification_settings.dart';
import 'package:rafeeq_alquran/features/adhan_notifications/logic/provider/adhan_notification_provider.dart';
import 'package:rafeeq_alquran/features/adhan_notifications/logic/repository/adhan_notification_repository.dart';
import 'package:rafeeq_alquran/features/auth/logic/entity/auth_session.dart';
import 'package:rafeeq_alquran/features/auth/logic/entity/auth_user.dart';
import 'package:rafeeq_alquran/features/auth/logic/provider/auth_provider.dart';
import 'package:rafeeq_alquran/features/auth/logic/repository/auth_repository.dart';
import 'package:rafeeq_alquran/features/daily_goal/logic/entity/daily_reading_goal.dart';
import 'package:rafeeq_alquran/features/daily_goal/logic/entity/reading_goal_type.dart';
import 'package:rafeeq_alquran/features/prayer_times/logic/entity/prayer_day.dart';
import 'package:rafeeq_alquran/features/prayer_times/logic/entity/prayer_name.dart';
import 'package:rafeeq_alquran/features/prayer_times/logic/entity/prayer_settings.dart';
import 'package:rafeeq_alquran/features/prayer_times/logic/entity/prayer_time.dart';
import 'package:rafeeq_alquran/features/prayer_times/logic/provider/prayer_times_provider.dart';
import 'package:rafeeq_alquran/features/prayer_times/logic/repository/prayer_times_repository.dart';
import 'package:rafeeq_alquran/features/quran_reminders/logic/entity/quran_reminder_settings.dart';
import 'package:rafeeq_alquran/features/quran_reminders/logic/entity/quran_reminder_slot.dart';
import 'package:rafeeq_alquran/features/quran_reminders/logic/provider/quran_reminder_provider.dart';
import 'package:rafeeq_alquran/features/quran_reminders/logic/repository/quran_reminder_repository.dart';
import 'package:rafeeq_alquran/features/reading_tracker/logic/entity/reading_progress_summary.dart';
import 'package:rafeeq_alquran/features/reading_tracker/logic/entity/reading_session.dart';
import 'package:rafeeq_alquran/features/reading_tracker/logic/provider/reading_tracker_provider.dart';
import 'package:rafeeq_alquran/features/reading_tracker/logic/repository/reading_tracker_repository.dart';
import 'package:rafeeq_alquran/features/settings/ui/pages/settings_page.dart';
import 'package:rafeeq_alquran/features/streak/logic/entity/reading_streak.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('settings page renders major settings sections', (tester) async {
    SharedPreferences.setMockInitialValues({});

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authRepositoryProvider.overrideWithValue(_FakeAuthRepository()),
          quranReminderRepositoryProvider.overrideWithValue(
            _FakeQuranReminderRepository(),
          ),
          prayerTimesRepositoryProvider.overrideWithValue(
            _FakePrayerTimesRepository(),
          ),
          adhanNotificationRepositoryProvider.overrideWithValue(
            _FakeAdhanNotificationRepository(),
          ),
          readingTrackerRepositoryProvider.overrideWithValue(
            _FakeReadingTrackerRepository(),
          ),
          localNotificationServiceProvider.overrideWithValue(
            _FakeNotificationService(),
          ),
          adhanLocalNotificationServiceProvider.overrideWithValue(
            _FakeNotificationService(),
          ),
        ],
        child: MaterialApp(
          locale: const Locale('en'),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          theme: AppTheme.light,
          home: const SettingsPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Settings'), findsOneWidget);
    expect(find.text('Language'), findsOneWidget);
    expect(find.text('Quran display'), findsOneWidget);
    expect(find.text('Show translations'), findsOneWidget);
    expect(find.text('Account'), findsOneWidget);
    expect(find.text('Quran reminders'), findsOneWidget);
    expect(find.text('Prayer location'), findsOneWidget);
    expect(find.text('Adhan notifications'), findsOneWidget);
    expect(find.text("Today's goal"), findsOneWidget);
    expect(find.text('Sync status'), findsOneWidget);
    expect(find.text('Notification test'), findsOneWidget);
  });

  testWidgets('quran reminder slot changes refresh schedules', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final quranRepository = _FakeQuranReminderRepository();

    await tester.pumpWidget(
      _settingsApp(
        quranReminderRepository: quranRepository,
        adhanNotificationRepository: _FakeAdhanNotificationRepository(),
      ),
    );
    await tester.pumpAndSettle();

    final afterFajrSwitch = find.widgetWithText(SwitchListTile, 'After Fajr');
    await tester.ensureVisible(afterFajrSwitch);
    await tester.tap(afterFajrSwitch);
    await tester.pumpAndSettle();

    expect(quranRepository.refreshCount, 1);
  });

  testWidgets('adhan setting changes refresh prayer schedules', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final adhanRepository = _FakeAdhanNotificationRepository();

    await tester.pumpWidget(
      _settingsApp(
        quranReminderRepository: _FakeQuranReminderRepository(),
        adhanNotificationRepository: adhanRepository,
      ),
    );
    await tester.pumpAndSettle();

    final fajrSwitch = find.widgetWithText(SwitchListTile, 'Fajr');
    await tester.ensureVisible(fajrSwitch);
    await tester.tap(fajrSwitch);
    await tester.pumpAndSettle();

    expect(adhanRepository.refreshCount, 1);
  });
}

Widget _settingsApp({
  required QuranReminderRepository quranReminderRepository,
  required AdhanNotificationRepository adhanNotificationRepository,
}) {
  final notificationService = _FakeNotificationService();
  return ProviderScope(
    overrides: [
      authRepositoryProvider.overrideWithValue(_FakeAuthRepository()),
      quranReminderRepositoryProvider.overrideWithValue(
        quranReminderRepository,
      ),
      prayerTimesRepositoryProvider.overrideWithValue(
        _FakePrayerTimesRepository(),
      ),
      adhanNotificationRepositoryProvider.overrideWithValue(
        adhanNotificationRepository,
      ),
      readingTrackerRepositoryProvider.overrideWithValue(
        _FakeReadingTrackerRepository(),
      ),
      localNotificationServiceProvider.overrideWithValue(notificationService),
      adhanLocalNotificationServiceProvider.overrideWithValue(
        notificationService,
      ),
    ],
    child: MaterialApp(
      locale: const Locale('en'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: AppTheme.light,
      home: const SettingsPage(),
    ),
  );
}

class _FakeAuthRepository implements AuthRepository {
  @override
  Stream<AuthSession> watchSession() {
    return Stream.value(const AuthSession.guest());
  }

  @override
  Future<AuthUser> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<AuthUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() async {}
}

class _FakeQuranReminderRepository implements QuranReminderRepository {
  QuranReminderSettings settings = QuranReminderSettings.defaults();
  int refreshCount = 0;

  @override
  Future<QuranReminderSettings> getSettings() async => settings;

  @override
  Future<QuranReminderSettings> setEnabled(bool isEnabled) async {
    settings = settings.copyWith(isEnabled: isEnabled);
    return settings;
  }

  @override
  Future<QuranReminderSettings> updateSlot(QuranReminderSlot slot) async {
    settings = settings.copyWith(
      slots: settings.slots
          .map((item) => item.id == slot.id ? slot : item)
          .toList(),
    );
    return settings;
  }

  @override
  Future<int> refreshSchedules({
    required bool isDailyGoalCompleted,
    required LocalNotificationContent content,
    DateTime? now,
  }) async {
    refreshCount++;
    return settings.slots.where((slot) => slot.isEnabled).length;
  }
}

class _FakePrayerTimesRepository implements PrayerTimesRepository {
  PrayerSettings settings = PrayerSettings.defaults();

  @override
  Future<PrayerSettings> getSettings() async => settings;

  @override
  Future<void> saveSettings(PrayerSettings settings) async {
    this.settings = settings;
  }

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
        PrayerTime(name: PrayerName.fajr, time: DateTime(2026, 5, 25, 4)),
        PrayerTime(name: PrayerName.dhuhr, time: DateTime(2026, 5, 25, 12)),
        PrayerTime(name: PrayerName.asr, time: DateTime(2026, 5, 25, 15)),
        PrayerTime(name: PrayerName.maghrib, time: DateTime(2026, 5, 25, 18)),
        PrayerTime(name: PrayerName.isha, time: DateTime(2026, 5, 25, 20)),
      ],
    );
  }

  @override
  Future<PrayerSettings> useCurrentLocation() async {
    settings = settings.copyWith(
      locationMode: PrayerLocationMode.gps,
      latitude: 15.36,
      longitude: 44.19,
    );
    return settings;
  }
}

class _FakeAdhanNotificationRepository implements AdhanNotificationRepository {
  AdhanNotificationSettings settings = AdhanNotificationSettings.defaults();
  int refreshCount = 0;

  @override
  Future<AdhanNotificationSettings> getSettings() async => settings;

  @override
  Future<AdhanNotificationSettings> setAdhanEnabled(
    PrayerName prayerName,
    bool isEnabled,
  ) async {
    final byPrayer = Map<PrayerName, bool>.of(settings.adhanEnabledByPrayer);
    byPrayer[prayerName] = isEnabled;
    settings = settings.copyWith(adhanEnabledByPrayer: byPrayer);
    return settings;
  }

  @override
  Future<AdhanNotificationSettings> setPrePrayerEnabled(bool isEnabled) async {
    settings = settings.copyWith(prePrayerEnabled: isEnabled);
    return settings;
  }

  @override
  Future<AdhanNotificationSettings> setVibrationEnabled(bool isEnabled) async {
    settings = settings.copyWith(vibrationEnabled: isEnabled);
    return settings;
  }

  @override
  Future<int> refreshSchedules({
    required PrayerDay prayerDay,
    required String Function(PrayerName prayerName) prayerLabelBuilder,
    required String adhanTitle,
    required String Function(String prayerLabel) adhanBodyBuilder,
    required String prePrayerTitle,
    required String Function(String prayerLabel) prePrayerBodyBuilder,
    DateTime? now,
  }) async {
    refreshCount++;
    return 5;
  }
}

class _FakeReadingTrackerRepository implements ReadingTrackerRepository {
  ReadingGoalType goalType = ReadingGoalType.oneAyahPerDay;

  @override
  Future<ReadingProgressSummary> getSummary({DateTime? date}) async {
    return ReadingProgressSummary(
      todayGoal: DailyReadingGoal(
        goalDate: DateTime(2026, 5, 25),
        goalType: goalType,
        targetVerses: goalType.targetVerses,
        completedVerses: 0,
        targetPages: goalType.targetPages,
        completedPages: 0,
        targetMinutes: goalType.targetMinutes,
        completedMinutes: 0,
        isCompleted: false,
      ),
      streak: const ReadingStreak(
        currentStreak: 0,
        longestStreak: 0,
        missedDays: 0,
      ),
    );
  }

  @override
  Future<ReadingGoalType> getGoalType() async => goalType;

  @override
  Future<void> setGoalType(ReadingGoalType goalType) async {
    this.goalType = goalType;
  }

  @override
  Future<void> recordSession(ReadingSession session) async {}
}

class _FakeNotificationService implements LocalNotificationService {
  LocalNotificationPermissionStatus status =
      LocalNotificationPermissionStatus.granted;

  @override
  Future<void> cancel(int id) async {}

  @override
  Future<void> initialize() async {}

  @override
  Future<void> openSettings() async {}

  @override
  Future<LocalNotificationPermissionStatus> permissionStatus() async {
    return status;
  }

  @override
  Future<LocalNotificationPermissionStatus> requestPermission() async {
    status = LocalNotificationPermissionStatus.granted;
    return status;
  }

  @override
  Future<void> schedule({
    required int id,
    required DateTime scheduledAt,
    required LocalNotificationContent content,
    LocalNotificationKind kind = LocalNotificationKind.quranReminder,
    bool enableVibration = true,
  }) async {}

  @override
  Future<void> showNow({
    required int id,
    required LocalNotificationContent content,
    LocalNotificationKind kind = LocalNotificationKind.quranReminder,
    bool enableVibration = true,
  }) async {}
}
