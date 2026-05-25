import '../../../daily_goal/logic/entity/daily_reading_goal.dart';
import '../../../streak/logic/entity/reading_streak.dart';

class ReadingProgressSummary {
  const ReadingProgressSummary({
    required this.todayGoal,
    required this.streak,
  });

  final DailyReadingGoal todayGoal;
  final ReadingStreak streak;
}
