enum PrayerName {
  fajr('fajr'),
  sunrise('sunrise'),
  dhuhr('dhuhr'),
  asr('asr'),
  maghrib('maghrib'),
  isha('isha');

  const PrayerName(this.storageValue);

  final String storageValue;

  static PrayerName fromStorageValue(String value) {
    return PrayerName.values.firstWhere(
      (name) => name.storageValue == value,
      orElse: () => PrayerName.fajr,
    );
  }
}
