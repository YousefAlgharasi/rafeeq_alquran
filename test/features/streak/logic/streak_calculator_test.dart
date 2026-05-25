import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/features/streak/logic/streak_calculator.dart';

void main() {
  const calculator = StreakCalculator();

  test('calculates current and longest streaks', () {
    final streak = calculator.calculate(
      today: DateTime(2026, 5, 24),
      days: [
        StreakDay(date: DateTime(2026, 5, 20), isCompleted: true),
        StreakDay(date: DateTime(2026, 5, 21), isCompleted: true),
        StreakDay(date: DateTime(2026, 5, 22), isCompleted: false),
        StreakDay(date: DateTime(2026, 5, 23), isCompleted: true),
        StreakDay(date: DateTime(2026, 5, 24), isCompleted: true),
      ],
    );

    expect(streak.currentStreak, 2);
    expect(streak.longestStreak, 2);
    expect(streak.missedDays, 1);
  });

  test('current streak resets when today is missed', () {
    final streak = calculator.calculate(
      today: DateTime(2026, 5, 24),
      days: [
        StreakDay(date: DateTime(2026, 5, 22), isCompleted: true),
        StreakDay(date: DateTime(2026, 5, 23), isCompleted: true),
        StreakDay(date: DateTime(2026, 5, 24), isCompleted: false),
      ],
    );

    expect(streak.currentStreak, 0);
    expect(streak.longestStreak, 2);
    expect(streak.missedDays, 1);
  });
}
