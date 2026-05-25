import 'prayer_time.dart';

class NextPrayer {
  const NextPrayer({required this.prayer, required this.remaining});

  final PrayerTime prayer;
  final Duration remaining;
}
