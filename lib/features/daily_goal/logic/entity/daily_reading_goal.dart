import 'reading_goal_type.dart';

class DailyReadingGoal {
  const DailyReadingGoal({
    required this.goalDate,
    required this.goalType,
    required this.targetVerses,
    required this.completedVerses,
    required this.targetPages,
    required this.completedPages,
    required this.targetMinutes,
    required this.completedMinutes,
    required this.isCompleted,
  });

  final DateTime goalDate;
  final ReadingGoalType goalType;
  final int targetVerses;
  final int completedVerses;
  final int targetPages;
  final int completedPages;
  final int targetMinutes;
  final int completedMinutes;
  final bool isCompleted;

  double get completionRatio {
    final target = switch (goalType) {
      ReadingGoalType.oneAyahPerDay ||
      ReadingGoalType.fiveAyahsPerDay =>
        targetVerses,
      ReadingGoalType.onePagePerDay => targetPages,
      ReadingGoalType.tenMinutesPerDay => targetMinutes,
    };
    final completed = switch (goalType) {
      ReadingGoalType.oneAyahPerDay ||
      ReadingGoalType.fiveAyahsPerDay =>
        completedVerses,
      ReadingGoalType.onePagePerDay => completedPages,
      ReadingGoalType.tenMinutesPerDay => completedMinutes,
    };

    if (target <= 0) {
      return 0;
    }

    return (completed / target).clamp(0, 1).toDouble();
  }
}
