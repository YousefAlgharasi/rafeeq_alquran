import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/core/sync/firestore_sync_datasource.dart';
import 'package:rafeeq_alquran/core/sync/sync_operation.dart';
import 'package:rafeeq_alquran/core/sync/sync_status.dart';

void main() {
  test('guest operations are rejected before Firestore writes', () async {
    final store = _FakeFirestoreUserDataStore();
    final datasource = CloudFirestoreSyncDatasource(userDataStore: store);

    await expectLater(
      datasource.pushOperation(
        _operation(ownerUserId: null, entityType: 'reflection_note'),
      ),
      throwsStateError,
    );

    expect(store.writes, isEmpty);
    expect(store.deletes, isEmpty);
  });

  test('logged-in operation routes to the user-owned collection', () async {
    final store = _FakeFirestoreUserDataStore();
    final datasource = CloudFirestoreSyncDatasource(userDataStore: store);

    await datasource.pushOperation(
      _operation(
        entityType: 'reflection_note',
        localEntityId: 9,
        payloadJson: '{"verse_key":"1:1","body":"local"}',
      ),
    );

    expect(store.writes, hasLength(1));
    expect(store.writes.single.ownerUserId, 'user-1');
    expect(store.writes.single.collectionPath, 'reflection_notes');
    expect(store.writes.single.documentId, '9');
    expect(store.writes.single.data['body'], 'local');
  });

  test('conflict policy keeps newer remote payload', () async {
    final store = _FakeFirestoreUserDataStore(
      initialData: {
        'user-1/reflection_notes/9': {
          'body': 'remote',
          'updated_at': '2026-05-25T10:00:00.000Z',
        },
      },
    );
    final datasource = CloudFirestoreSyncDatasource(userDataStore: store);

    await datasource.pushOperation(
      _operation(
        entityType: 'reflection_note',
        localEntityId: 9,
        payloadJson: '{"body":"local","updated_at":"2026-05-24T10:00:00.000Z"}',
      ),
    );

    expect(store.writes.single.data['body'], 'remote');
  });

  test(
    'quran text and tafsir entity types are not synced as user data',
    () async {
      final store = _FakeFirestoreUserDataStore();
      final datasource = CloudFirestoreSyncDatasource(userDataStore: store);

      await expectLater(
        datasource.pushOperation(_operation(entityType: 'quran_verse')),
        throwsUnsupportedError,
      );
      await expectLater(
        datasource.pushOperation(_operation(entityType: 'tafsir')),
        throwsUnsupportedError,
      );

      expect(store.writes, isEmpty);
    },
  );
}

SyncOperation _operation({
  String? ownerUserId = 'user-1',
  required String entityType,
  int localEntityId = 1,
  String operation = 'upsert',
  String payloadJson = '{"value":"local"}',
}) {
  return SyncOperation(
    id: 1,
    ownerUserId: ownerUserId,
    entityType: entityType,
    localEntityId: localEntityId,
    operation: operation,
    payloadJson: payloadJson,
    status: SyncStatus.pending,
    retryCount: 0,
    createdAt: DateTime.utc(2026, 5, 24),
    updatedAt: DateTime.utc(2026, 5, 24, 12),
  );
}

class _FakeFirestoreUserDataStore implements FirestoreUserDataStore {
  _FakeFirestoreUserDataStore({Map<String, Map<String, Object?>>? initialData})
    : _data = Map.of(initialData ?? {});

  final Map<String, Map<String, Object?>> _data;
  final writes = <_Write>[];
  final deletes = <_Delete>[];

  @override
  Future<Map<String, Object?>?> getData({
    required String ownerUserId,
    required String collectionPath,
    required String documentId,
  }) async {
    return _data[_key(ownerUserId, collectionPath, documentId)];
  }

  @override
  Future<void> setData({
    required String ownerUserId,
    required String collectionPath,
    required String documentId,
    required Map<String, Object?> data,
  }) async {
    writes.add(
      _Write(
        ownerUserId: ownerUserId,
        collectionPath: collectionPath,
        documentId: documentId,
        data: data,
      ),
    );
    _data[_key(ownerUserId, collectionPath, documentId)] = data;
  }

  @override
  Future<void> deleteData({
    required String ownerUserId,
    required String collectionPath,
    required String documentId,
  }) async {
    deletes.add(
      _Delete(
        ownerUserId: ownerUserId,
        collectionPath: collectionPath,
        documentId: documentId,
      ),
    );
    _data.remove(_key(ownerUserId, collectionPath, documentId));
  }

  String _key(String ownerUserId, String collectionPath, String documentId) {
    return '$ownerUserId/$collectionPath/$documentId';
  }
}

class _Write {
  const _Write({
    required this.ownerUserId,
    required this.collectionPath,
    required this.documentId,
    required this.data,
  });

  final String ownerUserId;
  final String collectionPath;
  final String documentId;
  final Map<String, Object?> data;
}

class _Delete {
  const _Delete({
    required this.ownerUserId,
    required this.collectionPath,
    required this.documentId,
  });

  final String ownerUserId;
  final String collectionPath;
  final String documentId;
}
