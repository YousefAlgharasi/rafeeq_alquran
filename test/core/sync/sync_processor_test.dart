import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/core/database/app_database.dart';
import 'package:rafeeq_alquran/core/sync/connectivity_sync_listener.dart';
import 'package:rafeeq_alquran/core/sync/firestore_sync_datasource.dart';
import 'package:rafeeq_alquran/core/sync/sync_operation.dart';
import 'package:rafeeq_alquran/core/sync/sync_processor.dart';
import 'package:rafeeq_alquran/core/sync/sync_queue_manager.dart';
import 'package:rafeeq_alquran/core/sync/sync_status.dart';
import 'package:rafeeq_alquran/features/auth/logic/entity/auth_session.dart';
import 'package:rafeeq_alquran/features/auth/logic/entity/auth_user.dart';

void main() {
  late AppDatabase database;
  late SyncQueueManager queueManager;
  late _FakeFirestoreSyncDatasource datasource;
  late SyncProcessor processor;

  const loggedInSession = AuthSession.loggedIn(
    AuthUser(id: 'user-1', email: 'user@example.com'),
  );

  Future<void> enqueueFavorite() {
    return queueManager.enqueueLocalChange(
      session: loggedInSession,
      entityType: 'favorite',
      localEntityId: 7,
      operation: 'upsert',
      payloadJson: '{"item_key":"1:1"}',
      now: DateTime.utc(2026, 5, 24),
    );
  }

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    queueManager = SyncQueueManager(database);
    datasource = _FakeFirestoreSyncDatasource();
    processor = SyncProcessor(
      queueManager: queueManager,
      firestoreDatasource: datasource,
      connectivityListener: ConnectivitySyncListener(),
    );
  });

  tearDown(() async {
    await database.close();
  });

  test('guest sessions never process sync queue', () async {
    final processed = await processor.processPendingQueue(
      session: const AuthSession.guest(),
      isOnlineOverride: true,
    );

    expect(processed, 0);
    expect(datasource.pushedOperations, isEmpty);
  });

  test('logged-in offline sessions keep pending queue untouched', () async {
    await enqueueFavorite();

    final processed = await processor.processPendingQueue(
      session: loggedInSession,
      isOnlineOverride: false,
    );

    final rows = await database.select(database.syncQueue).get();

    expect(processed, 0);
    expect(datasource.pushedOperations, isEmpty);
    expect(rows.single.status, SyncStatus.pending.value);
  });

  test('logged-in online sessions push pending queue and mark completed',
      () async {
    await enqueueFavorite();

    final processed = await processor.processPendingQueue(
      session: loggedInSession,
      isOnlineOverride: true,
    );

    final rows = await database.select(database.syncQueue).get();

    expect(processed, 1);
    expect(datasource.pushedOperations.single.entityType, 'favorite');
    expect(rows.single.status, SyncStatus.completed.value);
  });

}

class _FakeFirestoreSyncDatasource implements FirestoreSyncDatasource {
  final pushedOperations = <SyncOperation>[];

  @override
  Future<void> pushOperation(SyncOperation operation) async {
    pushedOperations.add(operation);
  }
}
