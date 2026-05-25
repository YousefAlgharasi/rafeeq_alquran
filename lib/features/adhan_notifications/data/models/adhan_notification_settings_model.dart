import '../../../prayer_times/logic/entity/prayer_name.dart';
import '../../logic/entity/adhan_notification_settings.dart';

class AdhanNotificationSettingsModel extends AdhanNotificationSettings {
  const AdhanNotificationSettingsModel({
    required super.adhanEnabledByPrayer,
    required super.prePrayerEnabled,
    required super.vibrationEnabled,
  });

  factory AdhanNotificationSettingsModel.fromEntity(
    AdhanNotificationSettings settings,
  ) {
    return AdhanNotificationSettingsModel(
      adhanEnabledByPrayer: settings.adhanEnabledByPrayer,
      prePrayerEnabled: settings.prePrayerEnabled,
      vibrationEnabled: settings.vibrationEnabled,
    );
  }

  factory AdhanNotificationSettingsModel.fromJson(Map<String, Object?> json) {
    final defaults = AdhanNotificationSettings.defaults();
    final rawPrayers = json['adhan_enabled_by_prayer'];
    final adhanEnabledByPrayer = Map<PrayerName, bool>.of(
      defaults.adhanEnabledByPrayer,
    );

    if (rawPrayers is Map<String, Object?>) {
      for (final entry in rawPrayers.entries) {
        adhanEnabledByPrayer[PrayerName.fromStorageValue(entry.key)] =
            entry.value == true;
      }
    }

    return AdhanNotificationSettingsModel(
      adhanEnabledByPrayer: adhanEnabledByPrayer,
      prePrayerEnabled: json['pre_prayer_enabled'] as bool? ?? true,
      vibrationEnabled: json['vibration_enabled'] as bool? ?? true,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'adhan_enabled_by_prayer': adhanEnabledByPrayer.map(
        (key, value) => MapEntry(key.storageValue, value),
      ),
      'pre_prayer_enabled': prePrayerEnabled,
      'vibration_enabled': vibrationEnabled,
    };
  }
}
