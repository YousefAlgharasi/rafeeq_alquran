import '../../../prayer_times/logic/entity/prayer_name.dart';
import 'adhan_notification_type.dart';

class AdhanNotificationSchedule {
  const AdhanNotificationSchedule({
    required this.id,
    required this.type,
    required this.prayerName,
    required this.scheduledAt,
  });

  final int id;
  final AdhanNotificationType type;
  final PrayerName prayerName;
  final DateTime scheduledAt;
}
