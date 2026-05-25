import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../logic/entity/adhan_notification_schedule.dart';
import '../../logic/entity/adhan_notification_settings.dart';
import '../models/adhan_notification_settings_model.dart';

abstract class AdhanNotificationLocalDatasource {
  Future<AdhanNotificationSettings> getSettings();

  Future<void> saveSettings(AdhanNotificationSettings settings);

  Future<void> replaceSchedules(List<AdhanNotificationSchedule> schedules);
}

class DriftAdhanNotificationLocalDatasource
    implements AdhanNotificationLocalDatasource {
  const DriftAdhanNotificationLocalDatasource(this._database);

  static const _settingsKey = 'adhan_notification_settings';
  static const _notificationType = 'adhan_and_pre_prayer';

  final AppDatabase _database;

  @override
  Future<AdhanNotificationSettings> getSettings() async {
    final row =
        await (_database.select(_database.appSettings)
              ..where((table) => table.settingKey.equals(_settingsKey))
              ..limit(1))
            .getSingleOrNull();
    if (row == null) {
      return AdhanNotificationSettings.defaults();
    }

    try {
      return AdhanNotificationSettingsModel.fromJson(
        jsonDecode(row.settingValue) as Map<String, Object?>,
      );
    } on Object {
      return AdhanNotificationSettings.defaults();
    }
  }

  @override
  Future<void> saveSettings(AdhanNotificationSettings settings) async {
    final now = DateTime.now().toUtc();
    final encoded = jsonEncode(
      AdhanNotificationSettingsModel.fromEntity(settings).toJson(),
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
  Future<void> replaceSchedules(
    List<AdhanNotificationSchedule> schedules,
  ) async {
    await (_database.delete(
      _database.notificationSchedules,
    )..where((table) => table.notificationType.equals(_notificationType))).go();

    final now = DateTime.now().toUtc();
    for (final schedule in schedules) {
      await _database
          .into(_database.notificationSchedules)
          .insert(
            NotificationSchedulesCompanion.insert(
              notificationKey:
                  '${schedule.type.storageValue}_${schedule.prayerName.storageValue}',
              notificationType: _notificationType,
              scheduledAt: schedule.scheduledAt,
              payloadJson: Value(
                jsonEncode({
                  'notification_id': schedule.id,
                  'type': schedule.type.storageValue,
                  'prayer': schedule.prayerName.storageValue,
                }),
              ),
              createdAt: now,
              updatedAt: now,
            ),
          );
    }
  }
}
