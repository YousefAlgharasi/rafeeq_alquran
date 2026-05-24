import '../../features/auth/logic/entity/auth_session.dart';
import 'connectivity_sync_listener.dart';
import 'firestore_sync_datasource.dart';
import 'sync_queue_manager.dart';

class SyncProcessor {
  const SyncProcessor({
    required SyncQueueManager queueManager,
    required FirestoreSyncDatasource firestoreDatasource,
    required ConnectivitySyncListener connectivityListener,
  })  : _queueManager = queueManager,
        _firestoreDatasource = firestoreDatasource,
        _connectivityListener = connectivityListener;

  final SyncQueueManager _queueManager;
  final FirestoreSyncDatasource _firestoreDatasource;
  final ConnectivitySyncListener _connectivityListener;

  Future<int> processPendingQueue({
    required AuthSession session,
    bool? isOnlineOverride,
  }) async {
    if (!session.isLoggedIn) {
      return 0;
    }

    final isOnline = isOnlineOverride ?? await _connectivityListener.isOnline();
    if (!isOnline) {
      return 0;
    }

    final ownerUserId = session.user!.id;
    await _queueManager.resetFailedToPending(ownerUserId: ownerUserId);

    final operations = await _queueManager.pendingOperationsForUser(ownerUserId);
    var processedCount = 0;

    for (final operation in operations) {
      await _queueManager.markInProgress(operation.id);
      try {
        await _firestoreDatasource.pushOperation(operation);
        await _queueManager.markCompleted(operation.id);
        processedCount++;
      } catch (_) {
        await _queueManager.markFailed(operation);
      }
    }

    return processedCount;
  }
}
