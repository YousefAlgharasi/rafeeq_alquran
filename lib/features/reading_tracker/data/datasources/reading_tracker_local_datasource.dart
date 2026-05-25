import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../../daily_goal/logic/entity/daily_reading_goal.dart';
import '../../../daily_goal/logic/entity/reading_goal_type.dart';
import '../../../daily_goal/logic/goal_completion_calculator.dart';
import '../../../reading_tracker/logic/entity/reading_session.dart' as domain;
import '../../../streak/logic/streak_calculator.dart';

class ReadingTrackerLocalWriteResult {
  const ReadingTrackerLocalWriteResult({
    required this.sessionId,
    required this.goalId,
    required this.streakId,
  });

  final int sessionId;
  final int goalId;
  final int streakId;
}

abstract class ReadingTrackerLocalDatasource {
  Future<ReadingGoalType> getGoalType();

  Future<void> setGoalType(ReadingGoalType goalType);

  Future<DailyReadingGoal> getOrCreateGoal({
    required DateTime date,
    String? ownerUserId,
  });

  Future<ReadingTrackerLocalWriteResult> recordSession({
    required domain.ReadingSession session,
    required ReadingGoalType goalType,
    String? ownerUserId,
  });

  Future<List<StreakDay>> getStreakDays();
}

class DriftReadingTrackerLocalDatasource
    implements ReadingTrackerLocalDatasource {
  const DriftReadingTrackerLocalDatasource(this._database);

  static const _goalSettingKey = 'reading_goal_type';

  final AppDatabase _database;
  final GoalCompletionCalculator _goalCalculator =
      const GoalCompletionCalculator();

  @override
  Future<ReadingGoalType> getGoalType() async {
    final row = await (_database.select(_database.appSettings)
          ..where((table) => table.settingKey.equals(_goalSettingKey))
          ..limit(1))
        .getSingleOrNull();

    return ReadingGoalType.fromStorageValue(row?.settingValue ?? '');
  }

  @override
  Future<void> setGoalType(ReadingGoalType goalType) async {
    final existing = await (_database.select(_database.appSettings)
          ..where((table) => table.settingKey.equals(_goalSettingKey))
          ..limit(1))
        .getSingleOrNull();
    final now = DateTime.now().toUtc();

    if (existing == null) {
      await _database.into(_database.appSettings).insert(
            AppSettingsCompanion.insert(
              settingKey: _goalSettingKey,
              settingValue: goalType.storageValue,
              valueType: const Value('string'),
              createdAt: now,
              updatedAt: now,
            ),
          );
      return;
    }

    await (_database.update(_database.appSettings)
          ..where((table) => table.id.equals(existing.id)))
        .write(
      AppSettingsCompanion(
        settingValue: Value(goalType.storageValue),
        updatedAt: Value(now),
      ),
    );
  }

  @override
  Future<DailyReadingGoal> getOrCreateGoal({
    required DateTime date,
    String? ownerUserId,
  }) async {
    final goalType = await getGoalType();
    final row = await _getGoalRow(_dateOnly(date));
    if (row != null) {
      return _goalFromRow(row);
    }

    final id = await _insertGoal(
      date: date,
      goalType: goalType,
      ownerUserId: ownerUserId,
    );
    final created = await (_database.select(_database.dailyGoals)
          ..where((table) => table.id.equals(id)))
        .getSingle();
    return _goalFromRow(created);
  }

  @override
  Future<ReadingTrackerLocalWriteResult> recordSession({
    required domain.ReadingSession session,
    required ReadingGoalType goalType,
    String? ownerUserId,
  }) async {
    final sessionDate = _dateOnly(session.sessionDate);
    final now = DateTime.now().toUtc();
    final sessionId = await _database.into(_database.readingSessions).insert(
          ReadingSessionsCompanion.insert(
            sessionDate: sessionDate,
            startedAt: session.startedAt,
            endedAt: Value(session.endedAt),
            ayahCount: Value(session.ayahCount),
            pageCount: Value(session.pageCount),
            durationMinutes: Value(session.durationMinutes),
            startVerseKey: Value(session.startVerseKey),
            endVerseKey: Value(session.endVerseKey),
            ownerUserId: Value(ownerUserId),
            syncStatus: Value(ownerUserId == null ? 'local' : 'pending'),
            createdAt: now,
            updatedAt: now,
          ),
        );

    var goalRow = await _getGoalRow(sessionDate);
    final goalId = goalRow?.id ??
        await _insertGoal(
          date: sessionDate,
          goalType: goalType,
          ownerUserId: ownerUserId,
        );
    goalRow ??= await (_database.select(_database.dailyGoals)
          ..where((table) => table.id.equals(goalId)))
        .getSingle();

    final completedVerses = goalRow.completedVerses + session.ayahCount;
    final completedPages = goalRow.completedPages + session.pageCount;
    final completedMinutes = goalRow.completedMinutes + session.durationMinutes;
    final isCompleted = _goalCalculator.isCompleted(
      GoalProgressInput(
        goalType: ReadingGoalType.fromStorageValue(goalRow.goalType),
        completedVerses: completedVerses,
        completedPages: completedPages,
        completedMinutes: completedMinutes,
      ),
    );

    await (_database.update(_database.dailyGoals)
          ..where((table) => table.id.equals(goalId)))
        .write(
      DailyGoalsCompanion(
        completedVerses: Value(completedVerses),
        completedPages: Value(completedPages),
        completedMinutes: Value(completedMinutes),
        isCompleted: Value(isCompleted),
        ownerUserId: Value(ownerUserId),
        syncStatus: Value(ownerUserId == null ? 'local' : 'pending'),
        updatedAt: Value(now),
      ),
    );

    final streakId = await _upsertStreakRecord(
      date: sessionDate,
      isCompleted: isCompleted,
      ownerUserId: ownerUserId,
      now: now,
    );
    await _markMissedDays(beforeDate: sessionDate, ownerUserId: ownerUserId);

    return ReadingTrackerLocalWriteResult(
      sessionId: sessionId,
      goalId: goalId,
      streakId: streakId,
    );
  }

  @override
  Future<List<StreakDay>> getStreakDays() async {
    final rows = await (_database.select(_database.streakRecords)
          ..orderBy([(table) => OrderingTerm.asc(table.streakDate)]))
        .get();

    return rows
        .map((row) => StreakDay(date: row.streakDate, isCompleted: row.isCompleted))
        .toList();
  }

  Future<DailyGoal?> _getGoalRow(DateTime date) {
    return (_database.select(_database.dailyGoals)
          ..where((table) => table.goalDate.equals(_dateOnly(date)))
          ..limit(1))
        .getSingleOrNull();
  }

  Future<int> _insertGoal({
    required DateTime date,
    required ReadingGoalType goalType,
    String? ownerUserId,
  }) {
    final now = DateTime.now().toUtc();
    return _database.into(_database.dailyGoals).insert(
          DailyGoalsCompanion.insert(
            goalDate: _dateOnly(date),
            goalType: Value(goalType.storageValue),
            targetVerses: Value(goalType.targetVerses),
            targetPages: Value(goalType.targetPages),
            targetMinutes: Value(goalType.targetMinutes),
            ownerUserId: Value(ownerUserId),
            syncStatus: Value(ownerUserId == null ? 'local' : 'pending'),
            createdAt: now,
            updatedAt: now,
          ),
        );
  }

  Future<int> _upsertStreakRecord({
    required DateTime date,
    required bool isCompleted,
    required String? ownerUserId,
    required DateTime now,
  }) async {
    final normalized = _dateOnly(date);
    final existing = await (_database.select(_database.streakRecords)
          ..where((table) => table.streakDate.equals(normalized))
          ..limit(1))
        .getSingleOrNull();

    if (existing == null) {
      return _database.into(_database.streakRecords).insert(
            StreakRecordsCompanion.insert(
              streakDate: normalized,
              isCompleted: Value(isCompleted),
              isMissed: Value(!isCompleted),
              ownerUserId: Value(ownerUserId),
              syncStatus: Value(ownerUserId == null ? 'local' : 'pending'),
              createdAt: now,
              updatedAt: now,
            ),
          );
    }

    await (_database.update(_database.streakRecords)
          ..where((table) => table.id.equals(existing.id)))
        .write(
      StreakRecordsCompanion(
        isCompleted: Value(existing.isCompleted || isCompleted),
        isMissed: Value(!(existing.isCompleted || isCompleted)),
        ownerUserId: Value(ownerUserId),
        syncStatus: Value(ownerUserId == null ? 'local' : 'pending'),
        updatedAt: Value(now),
      ),
    );

    return existing.id;
  }

  Future<void> _markMissedDays({
    required DateTime beforeDate,
    required String? ownerUserId,
  }) async {
    final firstGoal = await (_database.select(_database.dailyGoals)
          ..orderBy([(table) => OrderingTerm.asc(table.goalDate)])
          ..limit(1))
        .getSingleOrNull();
    if (firstGoal == null) {
      return;
    }

    var cursor = _dateOnly(firstGoal.goalDate);
    final end = _dateOnly(beforeDate);
    while (cursor.isBefore(end)) {
      final goal = await _getGoalRow(cursor);
      if (goal != null && !goal.isCompleted) {
        await _upsertStreakRecord(
          date: cursor,
          isCompleted: false,
          ownerUserId: ownerUserId,
          now: DateTime.now().toUtc(),
        );
      }
      cursor = cursor.add(const Duration(days: 1));
    }
  }

  DailyReadingGoal _goalFromRow(DailyGoal row) {
    return DailyReadingGoal(
      goalDate: row.goalDate,
      goalType: ReadingGoalType.fromStorageValue(row.goalType),
      targetVerses: row.targetVerses,
      completedVerses: row.completedVerses,
      targetPages: row.targetPages,
      completedPages: row.completedPages,
      targetMinutes: row.targetMinutes,
      completedMinutes: row.completedMinutes,
      isCompleted: row.isCompleted,
    );
  }

  DateTime _dateOnly(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }
}
