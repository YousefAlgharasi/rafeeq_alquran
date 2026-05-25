import 'dart:convert';

import '../../logic/entity/prayer_day.dart';
import '../../logic/entity/prayer_name.dart';
import '../../logic/entity/prayer_time.dart';

class AlAdhanPrayerDayModel extends PrayerDay {
  AlAdhanPrayerDayModel({
    required super.date,
    required super.prayers,
    required super.locationLabel,
    super.hijriDate,
    super.source = 'AlAdhan',
  });

  factory AlAdhanPrayerDayModel.fromApiJson(
    Map<String, Object?> json, {
    required String locationLabel,
  }) {
    final timings = _map(json['timings']);
    final dateJson = _map(json['date']);
    final gregorian = _map(dateJson['gregorian']);
    final hijri = _map(dateJson['hijri']);
    final date = _parseApiDate(gregorian['date'] as String?);

    return AlAdhanPrayerDayModel(
      date: date,
      locationLabel: locationLabel,
      hijriDate: _formatHijriDate(hijri),
      prayers: [
        _parsePrayer(PrayerName.fajr, timings['Fajr'], date),
        _parsePrayer(PrayerName.sunrise, timings['Sunrise'], date),
        _parsePrayer(PrayerName.dhuhr, timings['Dhuhr'], date),
        _parsePrayer(PrayerName.asr, timings['Asr'], date),
        _parsePrayer(PrayerName.maghrib, timings['Maghrib'], date),
        _parsePrayer(PrayerName.isha, timings['Isha'], date),
      ],
    );
  }

  factory AlAdhanPrayerDayModel.fromCacheJson(
    Map<String, Object?> json, {
    required DateTime date,
    required String locationLabel,
  }) {
    final prayersJson = (json['prayers'] as List? ?? const [])
        .whereType<Map<String, Object?>>()
        .toList();

    return AlAdhanPrayerDayModel(
      date: date,
      locationLabel: locationLabel,
      hijriDate: json['hijri_date'] as String?,
      prayers: prayersJson
          .map(
            (prayerJson) => PrayerTime(
              name: PrayerName.fromStorageValue(
                prayerJson['name'] as String? ?? '',
              ),
              time: DateTime.parse(prayerJson['time'] as String),
            ),
          )
          .toList(),
    );
  }

  String toCacheJson() {
    return jsonEncode({
      'hijri_date': hijriDate,
      'prayers': prayers
          .map(
            (prayer) => {
              'name': prayer.name.storageValue,
              'time': prayer.time.toIso8601String(),
            },
          )
          .toList(),
    });
  }

  static Map<String, Object?> _map(Object? value) {
    return value is Map<String, Object?> ? value : <String, Object?>{};
  }

  static DateTime _parseApiDate(String? value) {
    final parts = (value ?? '').split('-');
    if (parts.length != 3) {
      return DateTime.now();
    }

    return DateTime(
      int.parse(parts[2]),
      int.parse(parts[1]),
      int.parse(parts[0]),
    );
  }

  static PrayerTime _parsePrayer(
    PrayerName name,
    Object? rawValue,
    DateTime date,
  ) {
    final cleanValue = (rawValue as String? ?? '00:00').split(' ').first;
    final parts = cleanValue.split(':');
    return PrayerTime(
      name: name,
      time: DateTime(
        date.year,
        date.month,
        date.day,
        int.parse(parts[0]),
        int.parse(parts[1]),
      ),
    );
  }

  static String? _formatHijriDate(Map<String, Object?> hijri) {
    final day = hijri['day'] as String?;
    final year = hijri['year'] as String?;
    final month = _map(hijri['month'])['en'] as String?;
    if (day == null || month == null || year == null) {
      return null;
    }

    return '$day $month $year';
  }
}
