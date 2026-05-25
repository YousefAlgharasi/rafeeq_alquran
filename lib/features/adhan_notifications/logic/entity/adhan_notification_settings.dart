import '../../../prayer_times/logic/entity/prayer_name.dart';

class AdhanNotificationSettings {
  const AdhanNotificationSettings({
    required this.adhanEnabledByPrayer,
    required this.prePrayerEnabled,
    required this.vibrationEnabled,
  });

  factory AdhanNotificationSettings.defaults() {
    return const AdhanNotificationSettings(
      adhanEnabledByPrayer: {
        PrayerName.fajr: true,
        PrayerName.dhuhr: true,
        PrayerName.asr: true,
        PrayerName.maghrib: true,
        PrayerName.isha: true,
      },
      prePrayerEnabled: true,
      vibrationEnabled: true,
    );
  }

  final Map<PrayerName, bool> adhanEnabledByPrayer;
  final bool prePrayerEnabled;
  final bool vibrationEnabled;

  bool isAdhanEnabled(PrayerName prayerName) {
    return adhanEnabledByPrayer[prayerName] ?? false;
  }

  AdhanNotificationSettings copyWith({
    Map<PrayerName, bool>? adhanEnabledByPrayer,
    bool? prePrayerEnabled,
    bool? vibrationEnabled,
  }) {
    return AdhanNotificationSettings(
      adhanEnabledByPrayer:
          adhanEnabledByPrayer ?? Map.of(this.adhanEnabledByPrayer),
      prePrayerEnabled: prePrayerEnabled ?? this.prePrayerEnabled,
      vibrationEnabled: vibrationEnabled ?? this.vibrationEnabled,
    );
  }
}
