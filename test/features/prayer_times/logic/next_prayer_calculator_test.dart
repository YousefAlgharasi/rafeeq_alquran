import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/features/prayer_times/logic/entity/prayer_day.dart';
import 'package:rafeeq_alquran/features/prayer_times/logic/entity/prayer_name.dart';
import 'package:rafeeq_alquran/features/prayer_times/logic/entity/prayer_time.dart';
import 'package:rafeeq_alquran/features/prayer_times/logic/next_prayer_calculator.dart';

void main() {
  const calculator = NextPrayerCalculator();

  test('returns the next remaining prayer from today', () {
    final today = _day(DateTime(2026, 5, 25));
    final result = calculator.calculate(
      now: DateTime(2026, 5, 25, 12, 30),
      today: today,
    );

    expect(result?.prayer.name, PrayerName.asr);
    expect(result?.remaining, const Duration(hours: 2, minutes: 45));
  });

  test('rolls over to tomorrow Fajr after Isha', () {
    final today = _day(DateTime(2026, 5, 25));
    final tomorrow = _day(DateTime(2026, 5, 26));
    final result = calculator.calculate(
      now: DateTime(2026, 5, 25, 22),
      today: today,
      tomorrow: tomorrow,
    );

    expect(result?.prayer.name, PrayerName.fajr);
    expect(result?.remaining, const Duration(hours: 7));
  });
}

PrayerDay _day(DateTime date) {
  DateTime at(int hour, int minute) {
    return DateTime(date.year, date.month, date.day, hour, minute);
  }

  return PrayerDay(
    date: date,
    locationLabel: 'Test',
    source: 'AlAdhan',
    prayers: [
      PrayerTime(name: PrayerName.fajr, time: at(5, 0)),
      PrayerTime(name: PrayerName.sunrise, time: at(6, 10)),
      PrayerTime(name: PrayerName.dhuhr, time: at(12, 0)),
      PrayerTime(name: PrayerName.asr, time: at(15, 15)),
      PrayerTime(name: PrayerName.maghrib, time: at(18, 40)),
      PrayerTime(name: PrayerName.isha, time: at(20, 10)),
    ],
  );
}
