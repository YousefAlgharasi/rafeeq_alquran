import 'dart:convert';

import '../../../../../core/sync/sync_queue_manager.dart';
import '../../../../auth/logic/entity/auth_session.dart';
import '../../../../daily_goal/logic/entity/reading_goal_type.dart';
import '../../../../streak/logic/streak_calculator.dart';
import '../../../logic/entity/reading_progress_summary.dart';
import '../../../logic/entity/reading_session.dart';
import '../../../logic/repository/reading_tracker_repository.dart';
import '../../datasources/reading_tracker_local_datasource.dart';

class ReadingTrackerRepositoryImpl implements ReadingTrackerRepository {
  const ReadingTrackerRepositoryImpl({
    required ReadingTrackerLocalDatasource localDatasource,
    required SyncQueueManager syncQueueManager,
    required AuthSession session,
    StreakCalculator streakCalculator = const StreakCalculator(),
  }) : _localDatasource = localDatasource,
       _syncQueueManager = syncQueueManager,
       _session = session,
       _streakCalculator = streakCalculator;

  final ReadingTrackerLocalDatasource _localDatasource;
  final SyncQueueManager _syncQueueManager;
  final AuthSession _session;
  final StreakCalculator _streakCalculator;

  @override
  Future<ReadingProgressSummary> getSummary({DateTime? date}) async {
    final ownerUserId = _session.user?.id;
    final todayGoal = await _localDatasource.getOrCreateGoal(
      date: date ?? DateTime.now(),
      ownerUserId: ownerUserId,
    );
    final streak = _streakCalculator.calculate(
      today: date ?? DateTime.now(),
      days: await _localDatasource.getStreakDays(),
    );

    return ReadingProgressSummary(todayGoal: todayGoal, streak: streak);
  }

  @override
  Future<ReadingGoalType> getGoalType() {
    return _localDatasource.getGoalType();
  }

  @override
  Future<void> setGoalType(ReadingGoalType goalType) async {
    await _localDatasource.setGoalType(goalType);
    await _enqueue(
      entityType: 'profile_settings',
      localEntityId: 0,
      payload: {
        'setting_key': 'reading_goal_type',
        'value': goalType.storageValue,
        'value_type': 'string',
      },
    );
  }

  @override
  Future<void> recordSession(ReadingSession session) async {
    final goalType = await _localDatasource.getGoalType();
    final ownerUserId = _session.user?.id;
    final result = await _localDatasource.recordSession(
      session: session,
      goalType: goalType,
      ownerUserId: ownerUserId,
    );

    await _enqueue(
      entityType: 'reading_session',
      localEntityId: result.sessionId,
      payload: {
        'session_date': session.sessionDate.toIso8601String(),
        'ayah_count': session.ayahCount,
        'page_count': session.pageCount,
        'duration_minutes': session.durationMinutes,
        'start_verse_key': session.startVerseKey,
        'end_verse_key': session.endVerseKey,
      },
    );
    await _enqueue(
      entityType: 'daily_goal',
      localEntityId: result.goalId,
      payload: {
        'goal_type': goalType.storageValue,
        'session_date': session.sessionDate.toIso8601String(),
      },
    );
    await _enqueue(
      entityType: 'streak_record',
      localEntityId: result.streakId,
      payload: {'streak_date': session.sessionDate.toIso8601String()},
    );
  }

  Future<void> _enqueue({
    required String entityType,
    required int localEntityId,
    required Map<String, Object?> payload,
  }) {
    return _syncQueueManager.enqueueLocalChange(
      session: _session,
      entityType: entityType,
      localEntityId: localEntityId,
      operation: 'upsert',
      payloadJson: jsonEncode(payload),
    );
  }
}
