import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database_provider.dart';
import '../../../../core/sync/sync_providers.dart';
import '../../../auth/logic/entity/auth_session.dart';
import '../../../auth/logic/provider/auth_provider.dart';
import '../../../daily_goal/logic/entity/reading_goal_type.dart';
import '../../data/datasources/reading_tracker_local_datasource.dart';
import '../../data/repository/repo_impl/reading_tracker_repository_impl.dart';
import '../entity/reading_progress_summary.dart';
import '../repository/reading_tracker_repository.dart';

final readingTrackerLocalDatasourceProvider =
    Provider<ReadingTrackerLocalDatasource>((ref) {
      return DriftReadingTrackerLocalDatasource(ref.watch(appDatabaseProvider));
    });

final readingTrackerRepositoryProvider = Provider<ReadingTrackerRepository>((
  ref,
) {
  final session = ref
      .watch(authSessionProvider)
      .when(
        data: (session) => session,
        error: (error, stackTrace) => const AuthSession.guest(),
        loading: () => const AuthSession.guest(),
      );
  return ReadingTrackerRepositoryImpl(
    localDatasource: ref.watch(readingTrackerLocalDatasourceProvider),
    syncQueueManager: ref.watch(syncQueueManagerProvider),
    session: session,
  );
});

final readingProgressSummaryProvider = FutureProvider<ReadingProgressSummary>((
  ref,
) {
  return ref.watch(readingTrackerRepositoryProvider).getSummary();
});

final readingGoalTypeProvider = FutureProvider<ReadingGoalType>((ref) {
  return ref.watch(readingTrackerRepositoryProvider).getGoalType();
});

final readingGoalControllerProvider = Provider<ReadingGoalController>((ref) {
  return ReadingGoalController(ref);
});

class ReadingGoalController {
  const ReadingGoalController(this._ref);

  final Ref _ref;

  Future<void> setGoalType(ReadingGoalType goalType) async {
    await _ref.read(readingTrackerRepositoryProvider).setGoalType(goalType);
    _ref.invalidate(readingGoalTypeProvider);
    _ref.invalidate(readingProgressSummaryProvider);
  }
}
