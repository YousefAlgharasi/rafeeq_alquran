import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../logic/entity/quran_reminder_schedule.dart';
import '../../logic/entity/quran_reminder_settings.dart';

abstract class QuranReminderLocalDatasource {
  Future<QuranReminderSettings> getSettings();

  Future<void> saveSettings(
    QuranReminderSettings settings, {
    String? ownerUserId,
  });

  Future<void> replaceSchedules(
    List<QuranReminderSchedule> schedules, {
    String? ownerUserId,
  });
}

class DriftQuranReminderLocalDatasource
    implements QuranReminderLocalDatasource {
  const DriftQuranReminderLocalDatasource(this._database);

  static const _settingsKey = 'quran_reminder_settings';
  static const _notificationType = 'quran_reading_reminder';

  final AppDatabase _database;

  @override
  Future<QuranReminderSettings> getSettings() async {
    final row =
        await (_database.select(_database.appSettings)
              ..where((table) => table.settingKey.equals(_settingsKey))
              ..limit(1))
            .getSingleOrNull();
    if (row == null) {
      return QuranReminderSettings.defaults();
    }

    try {
      final json = jsonDecode(row.settingValue) as Map<String, Object?>;
      return QuranReminderSettings.fromJson(json);
    } on Object {
      return QuranReminderSettings.defaults();
    }
  }

  @override
  Future<void> saveSettings(
    QuranReminderSettings settings, {
    String? ownerUserId,
  }) async {
    final existing =
        await (_database.select(_database.appSettings)
              ..where((table) => table.settingKey.equals(_settingsKey))
              ..limit(1))
            .getSingleOrNull();
    final now = DateTime.now().toUtc();
    final encoded = jsonEncode(settings.toJson());

    if (existing == null) {
      await _database
          .into(_database.appSettings)
          .insert(
            AppSettingsCompanion.insert(
              settingKey: _settingsKey,
              settingValue: encoded,
              valueType: const Value('json'),
              ownerUserId: Value(ownerUserId),
              syncStatus: Value(ownerUserId == null ? 'local' : 'pending'),
              createdAt: now,
              updatedAt: now,
            ),
          );
      return;
    }

    await (_database.update(
      _database.appSettings,
    )..where((table) => table.id.equals(existing.id))).write(
      AppSettingsCompanion(
        settingValue: Value(encoded),
        ownerUserId: Value(ownerUserId),
        syncStatus: Value(ownerUserId == null ? 'local' : 'pending'),
        updatedAt: Value(now),
      ),
    );
  }

  @override
  Future<void> replaceSchedules(
    List<QuranReminderSchedule> schedules, {
    String? ownerUserId,
  }) async {
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
                  '${_notificationType}_${schedule.slotId.storageValue}',
              notificationType: _notificationType,
              scheduledAt: schedule.scheduledAt.toUtc(),
              payloadJson: Value(
                jsonEncode({
                  'slot_id': schedule.slotId.storageValue,
                  'notification_id': schedule.notificationId,
                }),
              ),
              ownerUserId: Value(ownerUserId),
              syncStatus: Value(ownerUserId == null ? 'local' : 'pending'),
              createdAt: now,
              updatedAt: now,
            ),
          );
    }
  }
}
