import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/features/quran_reminders/logic/entity/quran_reminder_settings.dart';
import 'package:rafeeq_alquran/features/quran_reminders/logic/quran_reminder_decision_logic.dart';

void main() {
  const logic = QuranReminderDecisionLogic();

  test('returns no schedules when reminders are disabled', () {
    final schedules = logic.schedulesFor(
      QuranReminderDecisionInput(
        settings: QuranReminderSettings.defaults().copyWith(isEnabled: false),
        date: DateTime(2026, 5, 24),
        now: DateTime(2026, 5, 24, 6),
        isDailyGoalCompleted: false,
      ),
    );

    expect(schedules, isEmpty);
  });

  test('returns no schedules after daily goal completion', () {
    final schedules = logic.schedulesFor(
      QuranReminderDecisionInput(
        settings: QuranReminderSettings.defaults(),
        date: DateTime(2026, 5, 24),
        now: DateTime(2026, 5, 24, 6),
        isDailyGoalCompleted: true,
      ),
    );

    expect(schedules, isEmpty);
  });

  test('keeps reminder frequency unchanged after ignored days', () {
    final normal = logic.schedulesFor(
      QuranReminderDecisionInput(
        settings: QuranReminderSettings.defaults(),
        date: DateTime(2026, 5, 24),
        now: DateTime(2026, 5, 24),
        isDailyGoalCompleted: false,
      ),
    );
    final afterIgnoredDays = logic.schedulesFor(
      QuranReminderDecisionInput(
        settings: QuranReminderSettings.defaults(),
        date: DateTime(2026, 5, 24),
        now: DateTime(2026, 5, 24),
        isDailyGoalCompleted: false,
        ignoredReminderDays: 30,
      ),
    );

    expect(afterIgnoredDays.length, normal.length);
    expect(
      afterIgnoredDays.map((schedule) => schedule.slotId),
      normal.map((schedule) => schedule.slotId),
    );
  });

  test('uses prayer anchors when Fajr and Asr times are provided', () {
    final schedules = logic.schedulesFor(
      QuranReminderDecisionInput(
        settings: QuranReminderSettings.defaults(),
        date: DateTime(2026, 5, 24),
        now: DateTime(2026, 5, 24),
        isDailyGoalCompleted: false,
        fajrTime: DateTime(2026, 5, 24, 4, 20),
        asrTime: DateTime(2026, 5, 24, 15, 10),
      ),
    );

    expect(schedules.first.scheduledAt, DateTime(2026, 5, 24, 4, 50));
    expect(
      schedules.map((schedule) => schedule.scheduledAt),
      contains(DateTime(2026, 5, 24, 15, 40)),
    );
  });
}
