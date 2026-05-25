import '../../../../core/notifications/local_notification_service.dart';
import '../entity/quran_reminder_settings.dart';
import '../entity/quran_reminder_slot.dart';

abstract class QuranReminderRepository {
  Future<QuranReminderSettings> getSettings();

  Future<QuranReminderSettings> setEnabled(bool isEnabled);

  Future<QuranReminderSettings> updateSlot(QuranReminderSlot slot);

  Future<int> refreshSchedules({
    required bool isDailyGoalCompleted,
    required LocalNotificationContent content,
    DateTime? now,
  });
}
