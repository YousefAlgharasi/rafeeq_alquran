import 'package:drift/drift.dart';

import '../../features/auth/logic/entity/auth_session.dart';
import '../database/app_database.dart';
import 'sync_operation.dart';
import 'sync_status.dart';

class SyncQueueManager {
  const SyncQueueManager(this._database);

  final AppDatabase _database;

  Future<int?> enqueueLocalChange({
    required AuthSession session,
    required String entityType,
    required int localEntityId,
    required String operation,
    required String payloadJson,
    DateTime? now,
  }) async {
    if (!session.isLoggedIn) {
      return null;
    }

    final timestamp = now ?? DateTime.now().toUtc();

    return _database.into(_database.syncQueue).insert(
          SyncQueueCompanion.insert(
            ownerUserId: Value(session.user!.id),
            entityType: entityType,
            localEntityId: localEntityId,
            operation: operation,
            payloadJson: payloadJson,
            createdAt: timestamp,
            updatedAt: timestamp,
          ),
        );
  }

  Future<List<SyncOperation>> pendingOperationsForUser(String ownerUserId) async {
    final rows = await (_database.select(_database.syncQueue)
          ..where(
            (table) =>
                table.ownerUserId.equals(ownerUserId) &
                table.status.equals(SyncStatus.pending.value),
          )
          ..orderBy([
            (table) => OrderingTerm.asc(table.createdAt),
          ]))
        .get();

    return rows.map(SyncOperation.fromQueueRow).toList();
  }

  Future<void> markInProgress(int id, {DateTime? now}) {
    return _updateStatus(
      id,
      SyncStatus.inProgress,
      now: now,
      setLastAttempt: true,
    );
  }

  Future<void> markCompleted(int id, {DateTime? now}) {
    return _updateStatus(id, SyncStatus.completed, now: now);
  }

  Future<void> markFailed(
    SyncOperation operation, {
    DateTime? now,
  }) {
    final timestamp = now ?? DateTime.now().toUtc();
    return (_database.update(_database.syncQueue)
          ..where((table) => table.id.equals(operation.id)))
        .write(
      SyncQueueCompanion(
        status: Value(SyncStatus.failed.value),
        retryCount: Value(operation.retryCount + 1),
        updatedAt: Value(timestamp),
        lastAttemptAt: Value(timestamp),
      ),
    );
  }

  Future<void> resetFailedToPending({
    required String ownerUserId,
    DateTime? now,
  }) {
    final timestamp = now ?? DateTime.now().toUtc();
    return (_database.update(_database.syncQueue)
          ..where(
            (table) =>
                table.ownerUserId.equals(ownerUserId) &
                table.status.equals(SyncStatus.failed.value),
          ))
        .write(
      SyncQueueCompanion(
        status: Value(SyncStatus.pending.value),
        updatedAt: Value(timestamp),
      ),
    );
  }

  Future<void> _updateStatus(
    int id,
    SyncStatus status, {
    DateTime? now,
    bool setLastAttempt = false,
  }) {
    final timestamp = now ?? DateTime.now().toUtc();
    return (_database.update(_database.syncQueue)
          ..where((table) => table.id.equals(id)))
        .write(
      SyncQueueCompanion(
        status: Value(status.value),
        updatedAt: Value(timestamp),
        lastAttemptAt: setLastAttempt ? Value(timestamp) : const Value.absent(),
      ),
    );
  }
}
