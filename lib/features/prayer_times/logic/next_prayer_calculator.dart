import 'entity/next_prayer.dart';
import 'entity/prayer_day.dart';
import 'entity/prayer_name.dart';
import 'entity/prayer_time.dart';

class NextPrayerCalculator {
  const NextPrayerCalculator();

  NextPrayer? calculate({
    required DateTime now,
    required PrayerDay today,
    PrayerDay? tomorrow,
  }) {
    final upcoming =
        today.prayers
            .where(_isPrayer)
            .where((prayer) => prayer.time.isAfter(now))
            .toList()
          ..sort((a, b) => a.time.compareTo(b.time));

    if (upcoming.isNotEmpty) {
      return NextPrayer(
        prayer: upcoming.first,
        remaining: upcoming.first.time.difference(now),
      );
    }

    final nextDayPrayers = tomorrow?.prayers.where(_isPrayer).toList()
      ?..sort((a, b) => a.time.compareTo(b.time));
    if (nextDayPrayers == null || nextDayPrayers.isEmpty) {
      return null;
    }

    return NextPrayer(
      prayer: nextDayPrayers.first,
      remaining: nextDayPrayers.first.time.difference(now),
    );
  }

  bool _isPrayer(PrayerTime prayer) {
    return prayer.name != PrayerName.sunrise;
  }
}
