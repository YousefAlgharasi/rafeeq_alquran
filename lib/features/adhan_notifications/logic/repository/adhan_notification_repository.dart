import '../../../prayer_times/logic/entity/prayer_day.dart';
import '../../../prayer_times/logic/entity/prayer_name.dart';
import '../entity/adhan_notification_settings.dart';

abstract class AdhanNotificationRepository {
  Future<AdhanNotificationSettings> getSettings();

  Future<AdhanNotificationSettings> setAdhanEnabled(
    PrayerName prayerName,
    bool isEnabled,
  );

  Future<AdhanNotificationSettings> setPrePrayerEnabled(bool isEnabled);

  Future<AdhanNotificationSettings> setVibrationEnabled(bool isEnabled);

  Future<int> refreshSchedules({
    required PrayerDay prayerDay,
    required String Function(PrayerName prayerName) prayerLabelBuilder,
    required String adhanTitle,
    required String Function(String prayerLabel) adhanBodyBuilder,
    required String prePrayerTitle,
    required String Function(String prayerLabel) prePrayerBodyBuilder,
    DateTime? now,
  });
}
