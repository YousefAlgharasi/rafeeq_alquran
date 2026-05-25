import '../../logic/entity/prayer_settings.dart';

class PrayerSettingsModel extends PrayerSettings {
  const PrayerSettingsModel({
    required super.locationMode,
    required super.calculationMethod,
    required super.madhab,
    super.latitude,
    super.longitude,
    super.city,
    super.country,
  });

  factory PrayerSettingsModel.fromEntity(PrayerSettings settings) {
    return PrayerSettingsModel(
      locationMode: settings.locationMode,
      calculationMethod: settings.calculationMethod,
      madhab: settings.madhab,
      latitude: settings.latitude,
      longitude: settings.longitude,
      city: settings.city,
      country: settings.country,
    );
  }

  factory PrayerSettingsModel.fromJson(Map<String, Object?> json) {
    return PrayerSettingsModel(
      locationMode: PrayerLocationMode.fromStorageValue(
        json['location_mode'] as String? ?? 'gps',
      ),
      calculationMethod: json['calculation_method'] as int? ?? 4,
      madhab: json['madhab'] as int? ?? 0,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      city: json['city'] as String?,
      country: json['country'] as String?,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'location_mode': locationMode.storageValue,
      'calculation_method': calculationMethod,
      'madhab': madhab,
      'latitude': latitude,
      'longitude': longitude,
      'city': city,
      'country': country,
    };
  }
}
