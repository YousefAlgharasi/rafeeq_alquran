import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/core/database/app_database.dart';
import 'package:rafeeq_alquran/core/sync/sync_queue_manager.dart';
import 'package:rafeeq_alquran/core/sync/sync_status.dart';
import 'package:rafeeq_alquran/features/auth/logic/entity/auth_session.dart';
import 'package:rafeeq_alquran/features/auth/logic/entity/auth_user.dart';

void main() {
  late AppDatabase database;
  late SyncQueueManager queueManager;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    queueManager = SyncQueueManager(database);
  });

  tearDown(() async {
    await database.close();
  });

  test('guest changes are not enqueued', () async {
    final id = await queueManager.enqueueLocalChange(
      session: const AuthSession.guest(),
      entityType: 'reflection_note',
      localEntityId: 1,
      operation: 'upsert',
      payloadJson: '{"body":"local"}',
    );

    final rows = await database.select(database.syncQueue).get();

    expect(id, isNull);
    expect(rows, isEmpty);
  });

  test('logged-in offline changes enqueue as pending local work', () async {
    const session = AuthSession.loggedIn(
      AuthUser(id: 'user-1', email: 'user@example.com'),
    );

    final id = await queueManager.enqueueLocalChange(
      session: session,
      entityType: 'favorite',
      localEntityId: 7,
      operation: 'upsert',
      payloadJson: '{"item_key":"1:1"}',
      now: DateTime.utc(2026, 5, 24),
    );

    final row = await (database.select(database.syncQueue)
          ..where((table) => table.id.equals(id!)))
        .getSingle();

    expect(row.ownerUserId, 'user-1');
    expect(row.status, SyncStatus.pending.value);
    expect(row.entityType, 'favorite');
    expect(row.operation, 'upsert');
  });
}
