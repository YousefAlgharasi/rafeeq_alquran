import 'dart:convert';

import '../../../../../core/sync/sync_queue_manager.dart';
import '../../../../auth/logic/entity/auth_session.dart';
import '../../../data/datasources/aladhan_remote_datasource.dart';
import '../../../data/datasources/prayer_location_datasource.dart';
import '../../../data/datasources/prayer_times_local_datasource.dart';
import '../../../data/models/prayer_settings_model.dart';
import '../../../logic/entity/prayer_day.dart';
import '../../../logic/entity/prayer_settings.dart';
import '../../../logic/repository/prayer_times_repository.dart';

class PrayerTimesRepositoryImpl implements PrayerTimesRepository {
  const PrayerTimesRepositoryImpl({
    required PrayerTimesLocalDatasource localDatasource,
    required PrayerTimesRemoteDatasource remoteDatasource,
    required PrayerLocationDatasource locationDatasource,
    SyncQueueManager? syncQueueManager,
    AuthSession session = const AuthSession.guest(),
  }) : _localDatasource = localDatasource,
       _remoteDatasource = remoteDatasource,
       _locationDatasource = locationDatasource,
       _syncQueueManager = syncQueueManager,
       _session = session;

  final PrayerTimesLocalDatasource _localDatasource;
  final PrayerTimesRemoteDatasource _remoteDatasource;
  final PrayerLocationDatasource _locationDatasource;
  final SyncQueueManager? _syncQueueManager;
  final AuthSession _session;

  @override
  Future<PrayerSettings> getSettings() {
    return _localDatasource.getSettings();
  }

  @override
  Future<void> saveSettings(PrayerSettings settings) async {
    await _localDatasource.saveSettings(settings);
    await _enqueueSettings(settings);
  }

  @override
  Future<PrayerSettings> useCurrentLocation() async {
    final settings = await getSettings();
    final location = await _locationDatasource.getCurrentLocation();
    final updated = settings.copyWith(
      locationMode: PrayerLocationMode.gps,
      latitude: location.latitude,
      longitude: location.longitude,
    );
    await saveSettings(updated);
    return updated;
  }

  Future<void> _enqueueSettings(PrayerSettings settings) async {
    await _syncQueueManager?.enqueueLocalChange(
      session: _session,
      entityType: 'prayer_settings',
      localEntityId: 0,
      operation: 'upsert',
      payloadJson: jsonEncode(
        PrayerSettingsModel.fromEntity(settings).toJson(),
      ),
    );
  }

  @override
  Future<PrayerDay> getPrayerDay({
    DateTime? date,
    bool forceRefresh = false,
  }) async {
    final targetDate = date ?? DateTime.now();
    final settings = await getSettings();
    final cached = await _localDatasource.getCachedDay(
      date: targetDate,
      settings: settings,
    );
    if (cached != null && !forceRefresh) {
      return cached;
    }

    try {
      final month = await _fetchMonth(targetDate, settings);
      await _localDatasource.cacheMonth(days: month, settings: settings);
      return month.firstWhere(
        (day) => _isSameDay(day.date, targetDate),
        orElse: () {
          if (cached != null) {
            return cached;
          }
          throw const PrayerTimesException('Prayer times were not returned.');
        },
      );
    } on Object {
      if (cached != null) {
        return cached;
      }
      rethrow;
    }
  }

  Future<List<PrayerDay>> _fetchMonth(
    DateTime targetDate,
    PrayerSettings settings,
  ) {
    if (settings.locationMode == PrayerLocationMode.manual) {
      if (!settings.hasManualLocation) {
        throw const PrayerTimesException(
          'Manual city and country are required.',
        );
      }
      return _remoteDatasource.fetchMonthByCity(
        year: targetDate.year,
        month: targetDate.month,
        settings: settings,
      );
    }

    if (!settings.hasGpsLocation) {
      throw const PrayerTimesException('GPS location is required.');
    }
    return _remoteDatasource.fetchMonthByCoordinates(
      year: targetDate.year,
      month: targetDate.month,
      settings: settings,
    );
  }

  bool _isSameDay(DateTime left, DateTime right) {
    return left.year == right.year &&
        left.month == right.month &&
        left.day == right.day;
  }
}

class PrayerTimesException implements Exception {
  const PrayerTimesException(this.message);

  final String message;

  @override
  String toString() => message;
}
