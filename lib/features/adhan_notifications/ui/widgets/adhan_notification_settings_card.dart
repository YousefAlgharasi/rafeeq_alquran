import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../prayer_times/logic/entity/prayer_day.dart';
import '../../../prayer_times/logic/entity/prayer_name.dart';
import '../../../prayer_times/ui/widgets/next_prayer_countdown_card.dart';
import '../../logic/entity/adhan_notification_settings.dart';

class AdhanNotificationSettingsCard extends StatelessWidget {
  const AdhanNotificationSettingsCard({
    required this.settings,
    required this.prayerDay,
    required this.onAdhanChanged,
    required this.onPrePrayerChanged,
    required this.onVibrationChanged,
    required this.onRefreshSchedules,
    super.key,
  });

  final AdhanNotificationSettings settings;
  final PrayerDay? prayerDay;
  final Future<void> Function(PrayerName prayerName, bool isEnabled)
  onAdhanChanged;
  final Future<void> Function(bool isEnabled) onPrePrayerChanged;
  final Future<void> Function(bool isEnabled) onVibrationChanged;
  final Future<int> Function(PrayerDay prayerDay) onRefreshSchedules;

  static const _adhanPrayers = [
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
            Text(
              localizations.adhanNotifications,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            for (final prayer in _adhanPrayers)
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(prayerNameLabel(localizations, prayer)),
                value: settings.isAdhanEnabled(prayer),
                onChanged: (value) => onAdhanChanged(prayer, value),
              ),
            const Divider(),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(localizations.prePrayerNotifications),
              subtitle: Text(localizations.prePrayerNotificationsDescription),
              value: settings.prePrayerEnabled,
              onChanged: onPrePrayerChanged,
            ),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(localizations.vibration),
              value: settings.vibrationEnabled,
              onChanged: onVibrationChanged,
            ),
            const SizedBox(height: 8),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: FilledButton.icon(
                onPressed: prayerDay == null
                    ? null
                    : () async {
                        final count = await onRefreshSchedules(prayerDay!);
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '${localizations.prayerNotificationsScheduled}: $count',
                              ),
                            ),
                          );
                        }
                      },
                icon: const Icon(Icons.notifications_active_outlined),
                label: Text(localizations.schedulePrayerNotifications),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
