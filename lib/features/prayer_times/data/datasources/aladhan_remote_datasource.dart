import 'package:dio/dio.dart';

import '../../logic/entity/prayer_day.dart';
import '../../logic/entity/prayer_settings.dart';
import '../models/aladhan_prayer_times_model.dart';

abstract class PrayerTimesRemoteDatasource {
  Future<List<PrayerDay>> fetchMonthByCoordinates({
    required int year,
    required int month,
    required PrayerSettings settings,
  });

  Future<List<PrayerDay>> fetchMonthByCity({
    required int year,
    required int month,
    required PrayerSettings settings,
  });
}

class AlAdhanRemoteDatasource implements PrayerTimesRemoteDatasource {
  const AlAdhanRemoteDatasource(this._dio);

  static const _baseUrl = 'https://api.aladhan.com/v1';

  final Dio _dio;

  @override
  Future<List<PrayerDay>> fetchMonthByCoordinates({
    required int year,
    required int month,
    required PrayerSettings settings,
  }) async {
    final response = await _dio.get<Map<String, Object?>>(
      '$_baseUrl/calendar/$year/$month',
      queryParameters: {
        'latitude': settings.latitude,
        'longitude': settings.longitude,
        'method': settings.calculationMethod,
        'school': settings.madhab,
      },
    );

    return _parseMonth(
      response.data,
      locationLabel: '${settings.latitude}, ${settings.longitude}',
    );
  }

  @override
  Future<List<PrayerDay>> fetchMonthByCity({
    required int year,
    required int month,
    required PrayerSettings settings,
  }) async {
    final response = await _dio.get<Map<String, Object?>>(
      '$_baseUrl/calendarByCity/$year/$month',
      queryParameters: {
        'city': settings.city,
        'country': settings.country,
        'method': settings.calculationMethod,
        'school': settings.madhab,
      },
    );

    return _parseMonth(
      response.data,
      locationLabel: '${settings.city}, ${settings.country}',
    );
  }

  List<PrayerDay> _parseMonth(
    Map<String, Object?>? json, {
    required String locationLabel,
  }) {
    final data = json?['data'];
    if (data is! List) {
      return const [];
    }

    return data
        .whereType<Map<String, Object?>>()
        .map(
          (dayJson) => AlAdhanPrayerDayModel.fromApiJson(
            dayJson,
            locationLabel: locationLabel,
          ),
        )
        .toList();
  }
}
