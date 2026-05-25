import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/features/prayer_times/data/models/aladhan_prayer_times_model.dart';
import 'package:rafeeq_alquran/features/prayer_times/logic/entity/prayer_name.dart';

void main() {
  test('parses AlAdhan day response with timings and Hijri date', () {
    final model = AlAdhanPrayerDayModel.fromApiJson({
      'timings': {
        'Fajr': '04:12 (+03)',
        'Sunrise': '05:35 (+03)',
        'Dhuhr': '11:58 (+03)',
        'Asr': '15:18 (+03)',
        'Maghrib': '18:21 (+03)',
        'Isha': '19:45 (+03)',
      },
      'date': {
        'gregorian': {'date': '25-05-2026'},
        'hijri': {
          'day': '09',
          'month': {'en': 'Dhu al-Hijjah'},
          'year': '1447',
        },
      },
    }, locationLabel: "Sana'a, Yemen");

    expect(model.date, DateTime(2026, 5, 25));
    expect(model.hijriDate, '09 Dhu al-Hijjah 1447');
    expect(model.prayers.first.name, PrayerName.fajr);
    expect(model.prayers.first.time.hour, 4);
    expect(model.prayers.first.time.minute, 12);
    expect(model.prayers.last.name, PrayerName.isha);
  });

  test('round trips cache JSON', () {
    final model = AlAdhanPrayerDayModel.fromApiJson({
      'timings': {
        'Fajr': '04:12',
        'Sunrise': '05:35',
        'Dhuhr': '11:58',
        'Asr': '15:18',
        'Maghrib': '18:21',
        'Isha': '19:45',
      },
      'date': {
        'gregorian': {'date': '25-05-2026'},
      },
    }, locationLabel: "Sana'a, Yemen");

    final cached = AlAdhanPrayerDayModel.fromCacheJson(
      {
        'hijri_date': model.hijriDate,
        'prayers': model.prayers
            .map(
              (prayer) => {
                'name': prayer.name.storageValue,
                'time': prayer.time.toIso8601String(),
              },
            )
            .toList(),
      },
      date: model.date,
      locationLabel: model.locationLabel,
    );

    expect(cached.prayers.map((prayer) => prayer.name), [
      PrayerName.fajr,
      PrayerName.sunrise,
      PrayerName.dhuhr,
      PrayerName.asr,
      PrayerName.maghrib,
      PrayerName.isha,
    ]);
  });
}
