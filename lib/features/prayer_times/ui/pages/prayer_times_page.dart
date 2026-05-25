import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/responsive/responsive_breakpoints.dart';
import '../../../adhan_notifications/logic/provider/adhan_notification_provider.dart';
import '../../../adhan_notifications/ui/widgets/adhan_notification_settings_card.dart';
import '../../../quran_reminders/logic/provider/quran_reminder_provider.dart';
import '../../logic/entity/prayer_day.dart';
import '../../logic/entity/prayer_name.dart';
import '../../logic/entity/prayer_settings.dart';
import '../../logic/provider/prayer_times_provider.dart';
import '../widgets/next_prayer_countdown_card.dart';
import '../widgets/prayer_times_settings_card.dart';

class PrayerTimesPage extends ConsumerWidget {
  const PrayerTimesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final settings = ref.watch(prayerSettingsProvider);
    final prayerDay = ref.watch(todayPrayerTimesProvider);
    final nextPrayer = ref.watch(nextPrayerProvider);
    final adhanSettings = ref.watch(adhanNotificationSettingsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.prayerTimes),
        actions: [
          IconButton(
            tooltip: localizations.refreshPrayerTimes,
            onPressed: () async {
              await _refreshPrayerTimesAndAdhan(ref, localizations);
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final horizontalPadding =
                constraints.maxWidth >= ResponsiveBreakpoints.wideNavigation
                ? 32.0
                : 16.0;

            return RefreshIndicator(
              onRefresh: () {
                return _refreshPrayerTimesAndAdhan(ref, localizations);
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
                          nextPrayer.when(
                            data: (value) =>
                                NextPrayerCountdownCard(nextPrayer: value),
                            loading: () => const _LoadingCard(),
                            error: (error, stackTrace) =>
                                const NextPrayerCountdownCard(nextPrayer: null),
                          ),
                          const SizedBox(height: 12),
                          prayerDay.when(
                            data: (day) => _PrayerDayCard(day: day),
                            loading: () => const _LoadingCard(),
                            error: (error, stackTrace) => _MessageCard(
                              message: localizations.noPrayerTimesCached,
                            ),
                          ),
                          const SizedBox(height: 12),
                          adhanSettings.when(
                            data: (value) => AdhanNotificationSettingsCard(
                              settings: value,
                              prayerDay: prayerDay.asData?.value,
                              onAdhanChanged: (prayerName, isEnabled) async {
                                await ref
                                    .read(localNotificationServiceProvider)
                                    .requestPermission();
                                await ref
                                    .read(adhanNotificationControllerProvider)
                                    .setAdhanEnabled(prayerName, isEnabled);
                                final day = prayerDay.asData?.value;
                                if (day != null) {
                                  await _refreshAdhanSchedules(
                                    ref,
                                    localizations,
                                    day,
                                  );
                                }
                              },
                              onPrePrayerChanged: (isEnabled) async {
                                await ref
                                    .read(localNotificationServiceProvider)
                                    .requestPermission();
                                await ref
                                    .read(adhanNotificationControllerProvider)
                                    .setPrePrayerEnabled(isEnabled);
                                final day = prayerDay.asData?.value;
                                if (day != null) {
                                  await _refreshAdhanSchedules(
                                    ref,
                                    localizations,
                                    day,
                                  );
                                }
                              },
                              onVibrationChanged: (isEnabled) async {
                                await ref
                                    .read(adhanNotificationControllerProvider)
                                    .setVibrationEnabled(isEnabled);
                                final day = prayerDay.asData?.value;
                                if (day != null) {
                                  await _refreshAdhanSchedules(
                                    ref,
                                    localizations,
                                    day,
                                  );
                                }
                              },
                              onRefreshSchedules: (day) {
                                return _refreshAdhanSchedules(
                                  ref,
                                  localizations,
                                  day,
                                );
                              },
                            ),
                            loading: () => const _LoadingCard(),
                            error: (error, stackTrace) =>
                                const SizedBox.shrink(),
                          ),
                          const SizedBox(height: 12),
                          settings.when(
                            data: (value) => PrayerTimesSettingsCard(
                              settings: value,
                              onSave: (settings) async {
                                await ref
                                    .read(prayerSettingsControllerProvider)
                                    .save(settings);
                                final day = await ref.read(
                                  todayPrayerTimesProvider.future,
                                );
                                await _refreshAdhanSchedules(
                                  ref,
                                  localizations,
                                  day,
                                );
                              },
                              onUseCurrentLocation: () async {
                                await ref
                                    .read(prayerSettingsControllerProvider)
                                    .useCurrentLocation();
                                final day = await ref.read(
                                  todayPrayerTimesProvider.future,
                                );
                                await _refreshAdhanSchedules(
                                  ref,
                                  localizations,
                                  day,
                                );
                              },
                            ),
                            loading: () => const _LoadingCard(),
                            error: (error, stackTrace) =>
                                PrayerTimesSettingsCard(
                                  settings: PrayerSettings.defaults(),
                                  onSave: (settings) async {
                                    await ref
                                        .read(prayerSettingsControllerProvider)
                                        .save(settings);
                                    final day = await ref.read(
                                      todayPrayerTimesProvider.future,
                                    );
                                    await _refreshAdhanSchedules(
                                      ref,
                                      localizations,
                                      day,
                                    );
                                  },
                                  onUseCurrentLocation: () async {
                                    await ref
                                        .read(prayerSettingsControllerProvider)
                                        .useCurrentLocation();
                                    final day = await ref.read(
                                      todayPrayerTimesProvider.future,
                                    );
                                    await _refreshAdhanSchedules(
                                      ref,
                                      localizations,
                                      day,
                                    );
                                  },
                                ),
                          ),
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
}

Future<void> _refreshPrayerTimesAndAdhan(
  WidgetRef ref,
  AppLocalizations localizations,
) async {
  await ref.read(prayerSettingsControllerProvider).refresh();
  final prayerDay = await ref.read(todayPrayerTimesProvider.future);
  await _refreshAdhanSchedules(ref, localizations, prayerDay);
}

Future<int> _refreshAdhanSchedules(
  WidgetRef ref,
  AppLocalizations localizations,
  PrayerDay day,
) {
  return ref
      .read(adhanNotificationControllerProvider)
      .refreshSchedules(
        prayerDay: day,
        prayerLabelBuilder: (prayerName) =>
            _prayerLabel(localizations, prayerName),
        adhanTitle: localizations.prayerTimes,
        adhanBodyBuilder: localizations.adhanNotificationBody,
        prePrayerTitle: localizations.prePrayerNotifications,
        prePrayerBodyBuilder: localizations.prePrayerNotificationBody,
      );
}

class _PrayerDayCard extends StatelessWidget {
  const _PrayerDayCard({required this.day});

  final PrayerDay day;

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
            Text(day.locationLabel, style: theme.textTheme.titleMedium),
            const SizedBox(height: 4),
            Text(localizations.sourceAlAdhan),
            if (day.hijriDate != null) ...[
              const SizedBox(height: 4),
              Text('${localizations.hijriDate}: ${day.hijriDate}'),
            ],
            const Divider(height: 24),
            for (final prayer in day.prayers)
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(prayerNameLabel(localizations, prayer.name)),
                trailing: Text(_formatTime(prayer.time)),
              ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime time) {
    return '${time.hour.toString().padLeft(2, '0')}:'
        '${time.minute.toString().padLeft(2, '0')}';
  }
}

String _prayerLabel(AppLocalizations localizations, PrayerName prayerName) {
  return prayerNameLabel(localizations, prayerName);
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
