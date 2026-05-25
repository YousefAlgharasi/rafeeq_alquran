import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../logic/entity/next_prayer.dart';
import '../../logic/entity/prayer_name.dart';

class NextPrayerCountdownCard extends StatelessWidget {
  const NextPrayerCountdownCard({required this.nextPrayer, super.key});

  final NextPrayer? nextPrayer;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);

    if (nextPrayer == null) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(localizations.noPrayerTimesCached),
        ),
      );
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(localizations.nextPrayer, style: theme.textTheme.titleMedium),
            const SizedBox(height: 8),
            Text(
              prayerNameLabel(localizations, nextPrayer!.prayer.name),
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 8),
            Text(
              '${localizations.timeRemaining}: '
              '${_formatDuration(nextPrayer!.remaining)}',
              style: theme.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }

  String _formatDuration(Duration duration) {
    final safeDuration = duration.isNegative ? Duration.zero : duration;
    final hours = safeDuration.inHours;
    final minutes = safeDuration.inMinutes.remainder(60);
    return '${hours.toString().padLeft(2, '0')}:'
        '${minutes.toString().padLeft(2, '0')}';
  }
}

String prayerNameLabel(AppLocalizations localizations, PrayerName name) {
  final isArabic = localizations.isArabic;
  return switch (name) {
    PrayerName.fajr => isArabic ? 'الفجر' : 'Fajr',
    PrayerName.sunrise => isArabic ? 'الشروق' : 'Sunrise',
    PrayerName.dhuhr => isArabic ? 'الظهر' : 'Dhuhr',
    PrayerName.asr => isArabic ? 'العصر' : 'Asr',
    PrayerName.maghrib => isArabic ? 'المغرب' : 'Maghrib',
    PrayerName.isha => isArabic ? 'العشاء' : 'Isha',
  };
}
