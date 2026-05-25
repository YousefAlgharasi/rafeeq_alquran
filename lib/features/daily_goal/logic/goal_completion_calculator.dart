import 'entity/reading_goal_type.dart';

class GoalProgressInput {
  const GoalProgressInput({
    required this.goalType,
    required this.completedVerses,
    required this.completedPages,
    required this.completedMinutes,
  });

  final ReadingGoalType goalType;
  final int completedVerses;
  final int completedPages;
  final int completedMinutes;
}

class GoalCompletionCalculator {
  const GoalCompletionCalculator();

  bool isCompleted(GoalProgressInput input) {
    return switch (input.goalType) {
      ReadingGoalType.oneAyahPerDay =>
        input.completedVerses >= input.goalType.targetVerses,
      ReadingGoalType.fiveAyahsPerDay =>
        input.completedVerses >= input.goalType.targetVerses,
      ReadingGoalType.onePagePerDay =>
        input.completedPages >= input.goalType.targetPages,
      ReadingGoalType.tenMinutesPerDay =>
        input.completedMinutes >= input.goalType.targetMinutes,
    };
  }
}
