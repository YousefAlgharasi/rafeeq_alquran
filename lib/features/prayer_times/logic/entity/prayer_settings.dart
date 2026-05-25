enum PrayerLocationMode {
  gps('gps'),
  manual('manual');

  const PrayerLocationMode(this.storageValue);

  final String storageValue;

  static PrayerLocationMode fromStorageValue(String value) {
    return PrayerLocationMode.values.firstWhere(
      (mode) => mode.storageValue == value,
      orElse: () => PrayerLocationMode.gps,
    );
  }
}

class PrayerSettings {
  const PrayerSettings({
    required this.locationMode,
    required this.calculationMethod,
    required this.madhab,
    this.latitude,
    this.longitude,
    this.city,
    this.country,
  });

  factory PrayerSettings.defaults() {
    return const PrayerSettings(
      locationMode: PrayerLocationMode.gps,
      calculationMethod: 4,
      madhab: 0,
    );
  }

  final PrayerLocationMode locationMode;
  final int calculationMethod;
  final int madhab;
  final double? latitude;
  final double? longitude;
  final String? city;
  final String? country;

  String get locationKey {
    if (locationMode == PrayerLocationMode.manual) {
      return 'city:${city ?? ''}:${country ?? ''}';
    }
    return 'gps:${latitude?.toStringAsFixed(4) ?? ''}:'
        '${longitude?.toStringAsFixed(4) ?? ''}';
  }

  bool get hasGpsLocation => latitude != null && longitude != null;

  bool get hasManualLocation {
    return (city?.trim().isNotEmpty ?? false) &&
        (country?.trim().isNotEmpty ?? false);
  }

  PrayerSettings copyWith({
    PrayerLocationMode? locationMode,
    int? calculationMethod,
    int? madhab,
    double? latitude,
    double? longitude,
    String? city,
    String? country,
  }) {
    return PrayerSettings(
      locationMode: locationMode ?? this.locationMode,
      calculationMethod: calculationMethod ?? this.calculationMethod,
      madhab: madhab ?? this.madhab,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      city: city ?? this.city,
      country: country ?? this.country,
    );
  }
}
