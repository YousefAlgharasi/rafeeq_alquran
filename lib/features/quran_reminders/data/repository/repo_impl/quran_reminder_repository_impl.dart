import 'dart:convert';

import '../../../../../core/notifications/local_notification_service.dart';
import '../../../../../core/sync/sync_queue_manager.dart';
import '../../../../auth/logic/entity/auth_session.dart';
import '../../../data/datasources/quran_reminder_local_datasource.dart';
import '../../../logic/entity/quran_reminder_settings.dart';
import '../../../logic/entity/quran_reminder_slot.dart';
import '../../../logic/quran_reminder_decision_logic.dart';
import '../../../logic/repository/quran_reminder_repository.dart';

class QuranReminderRepositoryImpl implements QuranReminderRepository {
  const QuranReminderRepositoryImpl({
    required QuranReminderLocalDatasource localDatasource,
    required LocalNotificationService notificationService,
    required SyncQueueManager syncQueueManager,
    required AuthSession session,
    QuranReminderDecisionLogic decisionLogic =
        const QuranReminderDecisionLogic(),
  }) : _localDatasource = localDatasource,
       _notificationService = notificationService,
       _syncQueueManager = syncQueueManager,
       _session = session,
       _decisionLogic = decisionLogic;

  final QuranReminderLocalDatasource _localDatasource;
  final LocalNotificationService _notificationService;
  final SyncQueueManager _syncQueueManager;
  final AuthSession _session;
  final QuranReminderDecisionLogic _decisionLogic;

  @override
  Future<QuranReminderSettings> getSettings() {
    return _localDatasource.getSettings();
  }

  @override
  Future<QuranReminderSettings> setEnabled(bool isEnabled) async {
    final settings = (await _localDatasource.getSettings()).copyWith(
      isEnabled: isEnabled,
    );
    await _localDatasource.saveSettings(
      settings,
      ownerUserId: _session.user?.id,
    );
    await _enqueueSettings(settings);
    return settings;
  }

  @override
  Future<QuranReminderSettings> updateSlot(QuranReminderSlot slot) async {
    final current = await _localDatasource.getSettings();
    final updatedSlots = current.slots.map((item) {
      return item.id == slot.id ? slot : item;
    }).toList();
    final settings = current.copyWith(slots: updatedSlots);
    await _localDatasource.saveSettings(
      settings,
      ownerUserId: _session.user?.id,
    );
    await _enqueueSettings(settings);
    return settings;
  }

  @override
  Future<int> refreshSchedules({
    required bool isDailyGoalCompleted,
    required LocalNotificationContent content,
    DateTime? now,
  }) async {
    final settings = await _localDatasource.getSettings();
    final current = now ?? DateTime.now();
    final schedules = _decisionLogic.schedulesFor(
      QuranReminderDecisionInput(
        settings: settings,
        date: current,
        now: current,
        isDailyGoalCompleted: isDailyGoalCompleted,
      ),
    );

    for (final slot in settings.slots) {
      await _notificationService.cancel(slot.notificationId);
    }

    if (!settings.isEnabled || isDailyGoalCompleted) {
      await _localDatasource.replaceSchedules(
        const [],
        ownerUserId: _session.user?.id,
      );
      return 0;
    }

    for (final schedule in schedules) {
      await _notificationService.schedule(
        id: schedule.notificationId,
        scheduledAt: schedule.scheduledAt,
        content: content,
      );
    }
    await _localDatasource.replaceSchedules(
      schedules,
      ownerUserId: _session.user?.id,
    );
    return schedules.length;
  }

  Future<void> _enqueueSettings(QuranReminderSettings settings) async {
    await _syncQueueManager.enqueueLocalChange(
      session: _session,
      entityType: 'notification_preference',
      localEntityId: 0,
      operation: 'upsert',
      payloadJson: jsonEncode({
        'preference_key': 'quran_reminder_settings',
        'settings': settings.toJson(),
      }),
    );
  }
}
