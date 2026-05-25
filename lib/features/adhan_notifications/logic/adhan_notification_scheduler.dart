import '../../prayer_times/logic/entity/prayer_day.dart';
import '../../prayer_times/logic/entity/prayer_name.dart';
import 'entity/adhan_notification_schedule.dart';
import 'entity/adhan_notification_settings.dart';
import 'entity/adhan_notification_type.dart';

class AdhanNotificationScheduler {
  const AdhanNotificationScheduler();

  static const prePrayerOffset = Duration(minutes: 10);

  List<AdhanNotificationSchedule> schedulesFor({
    required PrayerDay prayerDay,
    required AdhanNotificationSettings settings,
    DateTime? now,
  }) {
    final schedules = <AdhanNotificationSchedule>[];

    for (final prayer in prayerDay.prayers) {
      if (!_canScheduleAdhan(prayer.name)) {
        continue;
      }

      if (settings.isAdhanEnabled(prayer.name)) {
        schedules.add(
          AdhanNotificationSchedule(
            id: _notificationId(
              prayerDay.date,
              prayer.name,
              AdhanNotificationType.adhan,
            ),
            type: AdhanNotificationType.adhan,
            prayerName: prayer.name,
            scheduledAt: prayer.time,
          ),
        );
      }

      if (settings.prePrayerEnabled) {
        schedules.add(
          AdhanNotificationSchedule(
            id: _notificationId(
              prayerDay.date,
              prayer.name,
              AdhanNotificationType.prePrayer,
            ),
            type: AdhanNotificationType.prePrayer,
            prayerName: prayer.name,
            scheduledAt: prayer.time.subtract(prePrayerOffset),
          ),
        );
      }
    }

    if (now == null) {
      return schedules;
    }

    return schedules
        .where((schedule) => schedule.scheduledAt.isAfter(now))
        .toList();
  }

  bool _canScheduleAdhan(PrayerName prayerName) {
    return prayerName != PrayerName.sunrise;
  }

  int _notificationId(
    DateTime date,
    PrayerName prayerName,
    AdhanNotificationType type,
  ) {
    final typeValue = type == AdhanNotificationType.adhan ? 1 : 2;
    final prayerValue = PrayerName.values.indexOf(prayerName) + 1;
    return int.parse(
      '2${date.year % 100}'
      '${date.month.toString().padLeft(2, '0')}'
      '${date.day.toString().padLeft(2, '0')}'
      '$typeValue$prayerValue',
    );
  }
}
