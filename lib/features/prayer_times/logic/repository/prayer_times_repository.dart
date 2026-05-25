import '../entity/prayer_day.dart';
import '../entity/prayer_settings.dart';

abstract class PrayerTimesRepository {
  Future<PrayerSettings> getSettings();

  Future<void> saveSettings(PrayerSettings settings);

  Future<PrayerDay> getPrayerDay({DateTime? date, bool forceRefresh = false});

  Future<PrayerSettings> useCurrentLocation();
}
