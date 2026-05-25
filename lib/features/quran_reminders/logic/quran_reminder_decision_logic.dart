import 'entity/quran_reminder_schedule.dart';
import 'entity/quran_reminder_settings.dart';

class QuranReminderDecisionInput {
  const QuranReminderDecisionInput({
    required this.settings,
    required this.date,
    required this.now,
    required this.isDailyGoalCompleted,
    this.ignoredReminderDays = 0,
    this.fajrTime,
    this.asrTime,
  });

  final QuranReminderSettings settings;
  final DateTime date;
  final DateTime now;
  final bool isDailyGoalCompleted;
  final int ignoredReminderDays;
  final DateTime? fajrTime;
  final DateTime? asrTime;
}

class QuranReminderDecisionLogic {
  const QuranReminderDecisionLogic();

  List<QuranReminderSchedule> schedulesFor(QuranReminderDecisionInput input) {
    if (!input.settings.isEnabled || input.isDailyGoalCompleted) {
      return const [];
    }

    return input.settings.slots
        .where((slot) => slot.isEnabled)
        .map(
          (slot) => QuranReminderSchedule(
            slotId: slot.id,
            notificationId: slot.notificationId,
            scheduledAt: slot.scheduledAtForDate(
              input.date,
              fajrTime: input.fajrTime,
              asrTime: input.asrTime,
            ),
          ),
        )
        .where((schedule) => schedule.scheduledAt.isAfter(input.now))
        .toList()
      ..sort((left, right) => left.scheduledAt.compareTo(right.scheduledAt));
  }
}
