import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/notifications/local_notification_service.dart';
import '../../../../core/responsive/responsive_breakpoints.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../adhan_notifications/logic/provider/adhan_notification_provider.dart';
import '../../../daily_ayah/logic/provider/daily_ayah_provider.dart';
import '../../../daily_ayah/ui/widgets/daily_ayah_card.dart';
import '../../../daily_goal/logic/entity/reading_goal_type.dart';
import '../../../daily_goal/ui/widgets/goal_type_label.dart';
import '../../../prayer_times/logic/entity/next_prayer.dart';
import '../../../prayer_times/logic/entity/prayer_day.dart';
import '../../../prayer_times/logic/entity/prayer_name.dart';
import '../../../prayer_times/logic/entity/prayer_time.dart';
import '../../../prayer_times/logic/provider/prayer_times_provider.dart';
import '../../../prayer_times/ui/widgets/next_prayer_countdown_card.dart';
import '../../../quran_reminders/logic/provider/quran_reminder_provider.dart';
import '../../../reading_tracker/logic/entity/reading_progress_summary.dart';
import '../../../reading_tracker/logic/provider/reading_tracker_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  String? _lastReminderRefreshKey;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final dailyAyah = ref.watch(dailyAyahProvider);
    final progress = ref.watch(readingProgressSummaryProvider);
    final prayerDay = ref.watch(todayPrayerTimesProvider);
    final nextPrayer = ref.watch(nextPrayerProvider);
    final hasLimitedCache =
        dailyAyah.hasError || progress.hasError || prayerDay.hasError;

    return Scaffold(
      appBar: AppBar(title: Text(localizations.home)),
      body: SafeArea(
        top: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide =
                constraints.maxWidth >= ResponsiveBreakpoints.wideNavigation;
            final horizontalPadding = isWide ? 32.0 : 16.0;

            return RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(dailyAyahProvider);
                ref.invalidate(readingProgressSummaryProvider);
                await ref.read(prayerSettingsControllerProvider).refresh();
                final day = await ref.read(todayPrayerTimesProvider.future);
                await _refreshAdhanSchedules(day, localizations);
              },
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                  vertical: 16,
                ),
                children: [
                  Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: ResponsiveBreakpoints.maxContentWidth,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _DashboardHeader(hasLimitedCache: hasLimitedCache),
                          const SizedBox(height: 12),
                          nextPrayer.when(
                            data: (value) =>
                                _NextPrayerSection(nextPrayer: value),
                            loading: () => const _LoadingCard(),
                            error: (error, stackTrace) =>
                                const _NextPrayerSection(nextPrayer: null),
                          ),
                          const SizedBox(height: 12),
                          prayerDay.when(
                            data: (day) => _PrayerSummaryCard(day: day),
                            loading: () => const _LoadingCard(),
                            error: (error, stackTrace) => _MessageCard(
                              message: localizations.noPrayerTimesCached,
                            ),
                          ),
                          const SizedBox(height: 12),
                          dailyAyah.when(
                            data: (ayah) =>
                                DailyAyahCard(dailyAyah: ayah, compact: true),
                            loading: () => const _LoadingCard(),
                            error: (error, stackTrace) => _MessageCard(
                              message: localizations.dailyAyahUnavailable,
                            ),
                          ),
                          const SizedBox(height: 12),
                          progress.when(
                            data: (summary) {
                              _refreshReminderSchedule(summary, localizations);
                              return _GoalStreakCard(summary: summary);
                            },
                            loading: () => const _LoadingCard(),
                            error: (error, stackTrace) => _MessageCard(
                              message: localizations.readingProgress,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const _AdhkarShortcutsCard(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _refreshReminderSchedule(
    ReadingProgressSummary summary,
    AppLocalizations localizations,
  ) {
    final goalDate = summary.todayGoal.goalDate;
    final refreshKey =
        '${goalDate.year}-${goalDate.month}-${goalDate.day}-${summary.todayGoal.isCompleted}';
    if (_lastReminderRefreshKey == refreshKey) {
      return;
    }
    _lastReminderRefreshKey = refreshKey;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      unawaited(
        ref
            .read(quranReminderRepositoryProvider)
            .refreshSchedules(
              isDailyGoalCompleted: summary.todayGoal.isCompleted,
              content: LocalNotificationContent(
                title: localizations.appName,
                body: localizations.quranReminderNotificationBody,
                payload: 'quran_reminder',
              ),
            ),
      );
    });
  }

  Future<int> _refreshAdhanSchedules(
    PrayerDay prayerDay,
    AppLocalizations localizations,
  ) {
    return ref
        .read(adhanNotificationControllerProvider)
        .refreshSchedules(
          prayerDay: prayerDay,
          prayerLabelBuilder: (prayerName) =>
              prayerNameLabel(localizations, prayerName),
          adhanTitle: localizations.prayerTimes,
          adhanBodyBuilder: localizations.adhanNotificationBody,
          prePrayerTitle: localizations.prePrayerNotifications,
          prePrayerBodyBuilder: localizations.prePrayerNotificationBody,
        );
  }
}

class _DashboardHeader extends StatelessWidget {
  const _DashboardHeader({required this.hasLimitedCache});

  final bool hasLimitedCache;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(localizations.home, style: theme.textTheme.headlineSmall),
              const SizedBox(height: 2),
              Text(localizations.homeDashboardSubtitle),
            ],
          ),
        ),
        Tooltip(
          message: localizations.cachedContentHint,
          child: Chip(
            avatar: Icon(
              hasLimitedCache ? Icons.cloud_off_outlined : Icons.offline_pin,
              size: 18,
            ),
            label: Text(
              hasLimitedCache
                  ? localizations.cacheLimited
                  : localizations.offlineReady,
            ),
          ),
        ),
      ],
    );
  }
}

class _NextPrayerSection extends StatelessWidget {
  const _NextPrayerSection({required this.nextPrayer});

  final NextPrayer? nextPrayer;

  @override
  Widget build(BuildContext context) {
    return NextPrayerCountdownCard(nextPrayer: nextPrayer);
  }
}

class _PrayerSummaryCard extends StatelessWidget {
  const _PrayerSummaryCard({required this.day});

  final PrayerDay day;

  static const _summaryPrayers = [
    PrayerName.fajr,
    PrayerName.dhuhr,
    PrayerName.asr,
    PrayerName.maghrib,
    PrayerName.isha,
  ];

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    localizations.todayPrayerTimes,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                TextButton.icon(
                  onPressed: () {
                    context.go(AppRouteDestination.prayerTimes.path);
                  },
                  icon: const Icon(Icons.schedule_outlined),
                  label: Text(localizations.prayerTimes),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final prayer in _orderedSummaryPrayers())
                  _PrayerTimeChip(prayer: prayer),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<PrayerTime> _orderedSummaryPrayers() {
    return [
      for (final name in _summaryPrayers)
        if (_prayerByName(name) != null) _prayerByName(name)!,
    ];
  }

  PrayerTime? _prayerByName(PrayerName name) {
    for (final prayer in day.prayers) {
      if (prayer.name == name) {
        return prayer;
      }
    }
    return null;
  }
}

class _PrayerTimeChip extends StatelessWidget {
  const _PrayerTimeChip({required this.prayer});

  final PrayerTime prayer;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Chip(
      label: Text(
        '${prayerNameLabel(localizations, prayer.name)} ${_formatTime(prayer.time)}',
      ),
    );
  }

  String _formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:'
        '${time.minute.toString().padLeft(2, '0')}';
  }
}

class _GoalStreakCard extends StatelessWidget {
  const _GoalStreakCard({required this.summary});

  final ReadingProgressSummary summary;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final goal = summary.todayGoal;
    final target = switch (goal.goalType) {
      ReadingGoalType.oneAyahPerDay ||
      ReadingGoalType.fiveAyahsPerDay => goal.targetVerses,
      ReadingGoalType.onePagePerDay => goal.targetPages,
      ReadingGoalType.tenMinutesPerDay => goal.targetMinutes,
    };
    final completed = switch (goal.goalType) {
      ReadingGoalType.oneAyahPerDay ||
      ReadingGoalType.fiveAyahsPerDay => goal.completedVerses,
      ReadingGoalType.onePagePerDay => goal.completedPages,
      ReadingGoalType.tenMinutesPerDay => goal.completedMinutes,
    };

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              localizations.readingProgress,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(value: goal.completionRatio),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                Chip(
                  avatar: const Icon(Icons.flag_outlined, size: 18),
                  label: Text(
                    '${goal.goalType.label(context)} '
                    '${localizations.dailyGoalProgress(completed, target)}',
                  ),
                ),
                Chip(
                  avatar: const Icon(
                    Icons.local_fire_department_outlined,
                    size: 18,
                  ),
                  label: Text(
                    '${localizations.currentStreak}: '
                    '${summary.streak.currentStreak}',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AdhkarShortcutsCard extends StatelessWidget {
  const _AdhkarShortcutsCard();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final shortcuts = [
      _AdhkarShortcut(
        label: localizations.morningAdhkar,
        icon: Icons.wb_sunny_outlined,
        path: '/adhkar/morning',
      ),
      _AdhkarShortcut(
        label: localizations.eveningAdhkar,
        icon: Icons.nights_stay_outlined,
        path: '/adhkar/evening',
      ),
      _AdhkarShortcut(
        label: localizations.sleepAdhkar,
        icon: Icons.bedtime_outlined,
        path: '/adhkar/sleep',
      ),
      _AdhkarShortcut(
        label: localizations.afterPrayerAdhkar,
        icon: Icons.format_list_numbered_rtl_outlined,
        path: '/adhkar/after_prayer',
      ),
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              localizations.adhkarShortcuts,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final shortcut in shortcuts)
                  ActionChip(
                    avatar: Icon(shortcut.icon, size: 18),
                    label: Text(shortcut.label),
                    onPressed: () {
                      context.go(shortcut.path);
                    },
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AdhkarShortcut {
  const _AdhkarShortcut({
    required this.label,
    required this.icon,
    required this.path,
  });

  final String label;
  final IconData icon;
  final String path;
}

class _LoadingCard extends StatelessWidget {
  const _LoadingCard();

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class _MessageCard extends StatelessWidget {
  const _MessageCard({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(message, textAlign: TextAlign.center),
      ),
    );
  }
}
