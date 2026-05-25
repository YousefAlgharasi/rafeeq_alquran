import 'prayer_time.dart';

class PrayerDay {
  const PrayerDay({
    required this.date,
    required this.prayers,
    required this.locationLabel,
    required this.source,
    this.hijriDate,
  });

  final DateTime date;
  final List<PrayerTime> prayers;
  final String locationLabel;
  final String source;
  final String? hijriDate;
}
