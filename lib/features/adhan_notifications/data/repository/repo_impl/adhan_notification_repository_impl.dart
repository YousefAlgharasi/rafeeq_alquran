import 'dart:convert';

import '../../../../../core/notifications/local_notification_service.dart';
import '../../../../../core/sync/sync_queue_manager.dart';
import '../../../../auth/logic/entity/auth_session.dart';
import '../../../../prayer_times/logic/entity/prayer_day.dart';
import '../../../../prayer_times/logic/entity/prayer_name.dart';
import '../../../data/datasources/adhan_notification_local_datasource.dart';
import '../../../data/models/adhan_notification_settings_model.dart';
import '../../../logic/adhan_notification_scheduler.dart';
import '../../../logic/entity/adhan_notification_settings.dart';
import '../../../logic/entity/adhan_notification_type.dart';
import '../../../logic/repository/adhan_notification_repository.dart';

class AdhanNotificationRepositoryImpl implements AdhanNotificationRepository {
  const AdhanNotificationRepositoryImpl({
    required AdhanNotificationLocalDatasource localDatasource,
    required LocalNotificationService notificationService,
    SyncQueueManager? syncQueueManager,
    AuthSession session = const AuthSession.guest(),
    AdhanNotificationScheduler scheduler = const AdhanNotificationScheduler(),
  }) : _localDatasource = localDatasource,
       _notificationService = notificationService,
       _syncQueueManager = syncQueueManager,
       _session = session,
       _scheduler = scheduler;

  final AdhanNotificationLocalDatasource _localDatasource;
  final LocalNotificationService _notificationService;
  final SyncQueueManager? _syncQueueManager;
  final AuthSession _session;
  final AdhanNotificationScheduler _scheduler;

  @override
  Future<AdhanNotificationSettings> getSettings() {
    return _localDatasource.getSettings();
  }

  @override
  Future<AdhanNotificationSettings> setAdhanEnabled(
    PrayerName prayerName,
    bool isEnabled,
  ) async {
    final current = await getSettings();
    final enabledByPrayer = Map<PrayerName, bool>.of(
      current.adhanEnabledByPrayer,
    );
    enabledByPrayer[prayerName] = isEnabled;
    final updated = current.copyWith(adhanEnabledByPrayer: enabledByPrayer);
    await _localDatasource.saveSettings(updated);
    await _enqueueSettings(updated);
    return updated;
  }

  @override
  Future<AdhanNotificationSettings> setPrePrayerEnabled(bool isEnabled) async {
    final updated = (await getSettings()).copyWith(prePrayerEnabled: isEnabled);
    await _localDatasource.saveSettings(updated);
    await _enqueueSettings(updated);
    return updated;
  }

  @override
  Future<AdhanNotificationSettings> setVibrationEnabled(bool isEnabled) async {
    final updated = (await getSettings()).copyWith(vibrationEnabled: isEnabled);
    await _localDatasource.saveSettings(updated);
    await _enqueueSettings(updated);
    return updated;
  }

  @override
  Future<int> refreshSchedules({
    required PrayerDay prayerDay,
    required String Function(PrayerName prayerName) prayerLabelBuilder,
    required String adhanTitle,
    required String Function(String prayerLabel) adhanBodyBuilder,
    required String prePrayerTitle,
    required String Function(String prayerLabel) prePrayerBodyBuilder,
    DateTime? now,
  }) async {
    final settings = await getSettings();
    final allPossibleSchedules = _scheduler.schedulesFor(
      prayerDay: prayerDay,
      settings: AdhanNotificationSettings.defaults(),
    );
    for (final schedule in allPossibleSchedules) {
      await _notificationService.cancel(schedule.id);
    }

    final schedules = _scheduler.schedulesFor(
      prayerDay: prayerDay,
      settings: settings,
      now: now ?? DateTime.now(),
    );

    for (final schedule in schedules) {
      final prayerLabel = prayerLabelBuilder(schedule.prayerName);
      final isAdhan = schedule.type == AdhanNotificationType.adhan;
      await _notificationService.schedule(
        id: schedule.id,
        scheduledAt: schedule.scheduledAt,
        kind: isAdhan
            ? LocalNotificationKind.adhan
            : LocalNotificationKind.prePrayer,
        enableVibration: settings.vibrationEnabled,
        content: LocalNotificationContent(
          title: isAdhan ? adhanTitle : prePrayerTitle,
          body: isAdhan
              ? adhanBodyBuilder(prayerLabel)
              : prePrayerBodyBuilder(prayerLabel),
          payload:
              '${schedule.type.storageValue}:${schedule.prayerName.storageValue}',
        ),
      );
    }

    await _localDatasource.replaceSchedules(schedules);
    return schedules.length;
  }

  Future<void> _enqueueSettings(AdhanNotificationSettings settings) async {
    await _syncQueueManager?.enqueueLocalChange(
      session: _session,
      entityType: 'adhan_notification_preference',
      localEntityId: 0,
      operation: 'upsert',
      payloadJson: jsonEncode({
        'preference_key': 'adhan_notification_settings',
        'settings': AdhanNotificationSettingsModel.fromEntity(
          settings,
        ).toJson(),
      }),
    );
  }
}
