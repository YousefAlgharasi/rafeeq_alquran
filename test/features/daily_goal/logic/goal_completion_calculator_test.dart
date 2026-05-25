import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/features/daily_goal/logic/entity/reading_goal_type.dart';
import 'package:rafeeq_alquran/features/daily_goal/logic/goal_completion_calculator.dart';

void main() {
  const calculator = GoalCompletionCalculator();

  test('completes ayah based goals from verse count', () {
    expect(
      calculator.isCompleted(
        const GoalProgressInput(
          goalType: ReadingGoalType.oneAyahPerDay,
          completedVerses: 1,
          completedPages: 0,
          completedMinutes: 0,
        ),
      ),
      isTrue,
    );
    expect(
      calculator.isCompleted(
        const GoalProgressInput(
          goalType: ReadingGoalType.fiveAyahsPerDay,
          completedVerses: 4,
          completedPages: 0,
          completedMinutes: 0,
        ),
      ),
      isFalse,
    );
  });

  test('completes page and minute based goals from matching progress', () {
    expect(
      calculator.isCompleted(
        const GoalProgressInput(
          goalType: ReadingGoalType.onePagePerDay,
          completedVerses: 0,
          completedPages: 1,
          completedMinutes: 0,
        ),
      ),
      isTrue,
    );
    expect(
      calculator.isCompleted(
        const GoalProgressInput(
          goalType: ReadingGoalType.tenMinutesPerDay,
          completedVerses: 0,
          completedPages: 0,
          completedMinutes: 9,
        ),
      ),
      isFalse,
    );
  });
}
