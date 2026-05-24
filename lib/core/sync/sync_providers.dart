import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/logic/provider/auth_provider.dart';
import '../database/database_provider.dart';
import 'connectivity_sync_listener.dart';
import 'firestore_sync_datasource.dart';
import 'sync_processor.dart';
import 'sync_queue_manager.dart';

final syncQueueManagerProvider = Provider<SyncQueueManager>((ref) {
  return SyncQueueManager(ref.watch(appDatabaseProvider));
});

final connectivitySyncListenerProvider = Provider<ConnectivitySyncListener>((
  ref,
) {
  return ConnectivitySyncListener();
});

final firestoreSyncDatasourceProvider = Provider<FirestoreSyncDatasource>((ref) {
  return CloudFirestoreSyncDatasource();
});

final syncProcessorProvider = Provider<SyncProcessor>((ref) {
  return SyncProcessor(
    queueManager: ref.watch(syncQueueManagerProvider),
    firestoreDatasource: ref.watch(firestoreSyncDatasourceProvider),
    connectivityListener: ref.watch(connectivitySyncListenerProvider),
  );
});

final syncEngineProvider = Provider<void>((ref) {
  final authSession = ref.watch(authSessionProvider);
  final processor = ref.watch(syncProcessorProvider);
  final connectivity = ref.watch(connectivitySyncListenerProvider);

  authSession.whenData((session) {
    if (!session.isLoggedIn) {
      return;
    }

    final subscription = connectivity.watchOnlineStatus().listen((isOnline) {
      if (isOnline) {
        processor.processPendingQueue(session: session, isOnlineOverride: true);
      }
    });

    ref.onDispose(subscription.cancel);
  });
});
