import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/features/adhan_notifications/logic/adhan_notification_scheduler.dart';
import 'package:rafeeq_alquran/features/adhan_notifications/logic/entity/adhan_notification_settings.dart';
import 'package:rafeeq_alquran/features/adhan_notifications/logic/entity/adhan_notification_type.dart';
import 'package:rafeeq_alquran/features/prayer_times/logic/entity/prayer_day.dart';
import 'package:rafeeq_alquran/features/prayer_times/logic/entity/prayer_name.dart';
import 'package:rafeeq_alquran/features/prayer_times/logic/entity/prayer_time.dart';

void main() {
  const scheduler = AdhanNotificationScheduler();

  test('schedule includes 5 adhan notifications', () {
    final schedules = scheduler.schedulesFor(
      prayerDay: _prayerDay(),
      settings: AdhanNotificationSettings.defaults().copyWith(
        prePrayerEnabled: false,
      ),
    );

    expect(
      schedules.where(
        (schedule) => schedule.type == AdhanNotificationType.adhan,
      ),
      hasLength(5),
    );
  });

  test('sunrise has no adhan', () {
    final schedules = scheduler.schedulesFor(
      prayerDay: _prayerDay(),
      settings: AdhanNotificationSettings.defaults(),
    );

    expect(
      schedules.where(
        (schedule) =>
            schedule.type == AdhanNotificationType.adhan &&
            schedule.prayerName == PrayerName.sunrise,
      ),
      isEmpty,
    );
  });

  test('pre-prayer notification time is prayer time minus 10 minutes', () {
    final schedules = scheduler.schedulesFor(
      prayerDay: _prayerDay(),
      settings: AdhanNotificationSettings.defaults().copyWith(
        adhanEnabledByPrayer: {
          PrayerName.fajr: false,
          PrayerName.dhuhr: false,
          PrayerName.asr: false,
          PrayerName.maghrib: false,
          PrayerName.isha: false,
        },
      ),
    );
    final dhuhrPrePrayer = schedules.singleWhere(
      (schedule) =>
          schedule.type == AdhanNotificationType.prePrayer &&
          schedule.prayerName == PrayerName.dhuhr,
    );

    expect(dhuhrPrePrayer.scheduledAt, DateTime(2026, 5, 25, 11, 50));
  });
}

PrayerDay _prayerDay() {
  final date = DateTime(2026, 5, 25);
  DateTime at(int hour, int minute) {
    return DateTime(date.year, date.month, date.day, hour, minute);
  }

  return PrayerDay(
    date: date,
    locationLabel: 'Test',
    source: 'AlAdhan',
    prayers: [
      PrayerTime(name: PrayerName.fajr, time: at(4, 12)),
      PrayerTime(name: PrayerName.sunrise, time: at(5, 35)),
      PrayerTime(name: PrayerName.dhuhr, time: at(12, 0)),
      PrayerTime(name: PrayerName.asr, time: at(15, 18)),
      PrayerTime(name: PrayerName.maghrib, time: at(18, 21)),
      PrayerTime(name: PrayerName.isha, time: at(19, 45)),
    ],
  );
}
