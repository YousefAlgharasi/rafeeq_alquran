import '../../../daily_goal/logic/entity/reading_goal_type.dart';
import '../entity/reading_progress_summary.dart';
import '../entity/reading_session.dart';

abstract class ReadingTrackerRepository {
  Future<ReadingProgressSummary> getSummary({DateTime? date});

  Future<void> setGoalType(ReadingGoalType goalType);

  Future<ReadingGoalType> getGoalType();

  Future<void> recordSession(ReadingSession session);
}
