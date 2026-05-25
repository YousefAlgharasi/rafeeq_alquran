import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../logic/entity/prayer_day.dart';
import '../../logic/entity/prayer_settings.dart';
import '../models/aladhan_prayer_times_model.dart';
import '../models/prayer_settings_model.dart';

abstract class PrayerTimesLocalDatasource {
  Future<PrayerSettings> getSettings();

  Future<void> saveSettings(PrayerSettings settings);

  Future<PrayerDay?> getCachedDay({
    required DateTime date,
    required PrayerSettings settings,
  });

  Future<void> cacheMonth({
    required List<PrayerDay> days,
    required PrayerSettings settings,
  });
}

class DriftPrayerTimesLocalDatasource implements PrayerTimesLocalDatasource {
  const DriftPrayerTimesLocalDatasource(this._database);

  static const _settingsKey = 'prayer_times_settings';
  static const _source = 'AlAdhan';

  final AppDatabase _database;

  @override
  Future<PrayerSettings> getSettings() async {
    final row =
        await (_database.select(_database.appSettings)
              ..where((table) => table.settingKey.equals(_settingsKey))
              ..limit(1))
            .getSingleOrNull();
    if (row == null) {
      return PrayerSettings.defaults();
    }

    try {
      return PrayerSettingsModel.fromJson(
        jsonDecode(row.settingValue) as Map<String, Object?>,
      );
    } on Object {
      return PrayerSettings.defaults();
    }
  }

  @override
  Future<void> saveSettings(PrayerSettings settings) async {
    final now = DateTime.now().toUtc();
    final encoded = jsonEncode(
      PrayerSettingsModel.fromEntity(settings).toJson(),
    );
    final existing =
        await (_database.select(_database.appSettings)
              ..where((table) => table.settingKey.equals(_settingsKey))
              ..limit(1))
            .getSingleOrNull();

    if (existing == null) {
      await _database
          .into(_database.appSettings)
          .insert(
            AppSettingsCompanion.insert(
              settingKey: _settingsKey,
              settingValue: encoded,
              valueType: const Value('json'),
              createdAt: now,
              updatedAt: now,
            ),
          );
      return;
    }

    await (_database.update(
      _database.appSettings,
    )..where((table) => table.id.equals(existing.id))).write(
      AppSettingsCompanion(settingValue: Value(encoded), updatedAt: Value(now)),
    );
  }

  @override
  Future<PrayerDay?> getCachedDay({
    required DateTime date,
    required PrayerSettings settings,
  }) async {
    final day = _dateOnly(date);
    final row =
        await (_database.select(_database.prayerTimesCache)
              ..where((table) => table.prayerDate.equals(day))
              ..where((table) => table.locationKey.equals(settings.locationKey))
              ..where(
                (table) => table.calculationMethod.equals(
                  settings.calculationMethod.toString(),
                ),
              )
              ..where(
                (table) => table.madhab.equals(settings.madhab.toString()),
              )
              ..limit(1))
            .getSingleOrNull();

    if (row == null) {
      return null;
    }

    return AlAdhanPrayerDayModel.fromCacheJson(
      jsonDecode(row.timingsJson) as Map<String, Object?>,
      date: row.prayerDate,
      locationLabel: _locationLabel(settings),
    );
  }

  @override
  Future<void> cacheMonth({
    required List<PrayerDay> days,
    required PrayerSettings settings,
  }) async {
    final now = DateTime.now().toUtc();
    await _database.transaction(() async {
      for (final day in days) {
        final prayerDate = _dateOnly(day.date);
        await (_database.delete(_database.prayerTimesCache)
              ..where((table) => table.prayerDate.equals(prayerDate))
              ..where((table) => table.locationKey.equals(settings.locationKey))
              ..where(
                (table) => table.calculationMethod.equals(
                  settings.calculationMethod.toString(),
                ),
              )
              ..where(
                (table) => table.madhab.equals(settings.madhab.toString()),
              ))
            .go();
        await _database
            .into(_database.prayerTimesCache)
            .insert(
              PrayerTimesCacheCompanion.insert(
                prayerDate: prayerDate,
                locationKey: settings.locationKey,
                calculationMethod: Value(settings.calculationMethod.toString()),
                madhab: Value(settings.madhab.toString()),
                timingsJson: _toCacheJson(day),
                source: _source,
                createdAt: now,
                updatedAt: now,
              ),
            );
      }
    });
  }

  String _toCacheJson(PrayerDay day) {
    if (day is AlAdhanPrayerDayModel) {
      return day.toCacheJson();
    }

    return jsonEncode({
      'hijri_date': day.hijriDate,
      'prayers': day.prayers
          .map(
            (prayer) => {
              'name': prayer.name.storageValue,
              'time': prayer.time.toIso8601String(),
            },
          )
          .toList(),
    });
  }

  DateTime _dateOnly(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  String _locationLabel(PrayerSettings settings) {
    if (settings.locationMode == PrayerLocationMode.manual) {
      return '${settings.city}, ${settings.country}';
    }
    return '${settings.latitude}, ${settings.longitude}';
  }
}
