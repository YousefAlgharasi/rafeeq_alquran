import 'quran_reminder_slot.dart';

class QuranReminderSchedule {
  const QuranReminderSchedule({
    required this.slotId,
    required this.notificationId,
    required this.scheduledAt,
  });

  final QuranReminderSlotId slotId;
  final int notificationId;
  final DateTime scheduledAt;
}
