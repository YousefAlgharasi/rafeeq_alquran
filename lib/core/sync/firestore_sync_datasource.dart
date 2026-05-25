import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'sync_conflict_policy.dart';
import 'sync_operation.dart';

abstract class FirestoreSyncDatasource {
  Future<void> pushOperation(SyncOperation operation);
}

abstract class FirestoreUserDataStore {
  Future<SyncPayload?> getData({
    required String ownerUserId,
    required String collectionPath,
    required String documentId,
  });

  Future<void> setData({
    required String ownerUserId,
    required String collectionPath,
    required String documentId,
    required SyncPayload data,
  });

  Future<void> deleteData({
    required String ownerUserId,
    required String collectionPath,
    required String documentId,
  });
}

class CloudFirestoreUserDataStore implements FirestoreUserDataStore {
  CloudFirestoreUserDataStore({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  @override
  Future<SyncPayload?> getData({
    required String ownerUserId,
    required String collectionPath,
    required String documentId,
  }) async {
    final snapshot = await _document(
      ownerUserId: ownerUserId,
      collectionPath: collectionPath,
      documentId: documentId,
    ).get();
    return snapshot.data();
  }

  @override
  Future<void> setData({
    required String ownerUserId,
    required String collectionPath,
    required String documentId,
    required SyncPayload data,
  }) {
    return _document(
      ownerUserId: ownerUserId,
      collectionPath: collectionPath,
      documentId: documentId,
    ).set(data, SetOptions(merge: true));
  }

  @override
  Future<void> deleteData({
    required String ownerUserId,
    required String collectionPath,
    required String documentId,
  }) {
    return _document(
      ownerUserId: ownerUserId,
      collectionPath: collectionPath,
      documentId: documentId,
    ).delete();
  }

  DocumentReference<SyncPayload> _document({
    required String ownerUserId,
    required String collectionPath,
    required String documentId,
  }) {
    return _firestore
        .collection('users')
        .doc(ownerUserId)
        .collection(collectionPath)
        .doc(documentId)
        .withConverter<SyncPayload>(
          fromFirestore: (snapshot, _) => snapshot.data() ?? {},
          toFirestore: (value, _) => value,
        );
  }
}

class CloudFirestoreSyncDatasource implements FirestoreSyncDatasource {
  CloudFirestoreSyncDatasource({
    FirebaseFirestore? firestore,
    FirestoreUserDataStore? userDataStore,
    SyncConflictPolicy conflictPolicy = const LastWriteWinsConflictPolicy(),
  }) : _userDataStore =
           userDataStore ?? CloudFirestoreUserDataStore(firestore: firestore),
       _conflictPolicy = conflictPolicy;

  final FirestoreUserDataStore _userDataStore;
  final SyncConflictPolicy _conflictPolicy;

  @override
  Future<void> pushOperation(SyncOperation operation) async {
    final ownerUserId = operation.ownerUserId;
    if (ownerUserId == null) {
      throw StateError('Cannot sync an operation without an owner user id.');
    }

    final adapter = FirestoreSyncAdapter.forEntityType(operation.entityType);
    await adapter.push(
      operation: operation,
      ownerUserId: ownerUserId,
      userDataStore: _userDataStore,
      conflictPolicy: _conflictPolicy,
    );
  }
}

class FirestoreSyncAdapter {
  const FirestoreSyncAdapter({
    required this.entityType,
    required this.collectionPath,
    String Function(SyncOperation operation, SyncPayload payload)? documentId,
  }) : _documentId = documentId;

  final String entityType;
  final String collectionPath;
  final String Function(SyncOperation operation, SyncPayload payload)?
  _documentId;

  static const _adapters = <String, FirestoreSyncAdapter>{
    'profile_settings': FirestoreSyncAdapter(
      entityType: 'profile_settings',
      collectionPath: 'profile_settings',
      documentId: _settingsDocumentId,
    ),
    'app_setting': FirestoreSyncAdapter(
      entityType: 'app_setting',
      collectionPath: 'profile_settings',
      documentId: _settingsDocumentId,
    ),
    'reading_progress': FirestoreSyncAdapter(
      entityType: 'reading_progress',
      collectionPath: 'reading_progress',
    ),
    'reading_session': FirestoreSyncAdapter(
      entityType: 'reading_session',
      collectionPath: 'reading_progress',
    ),
    'daily_goal': FirestoreSyncAdapter(
      entityType: 'daily_goal',
      collectionPath: 'daily_goals',
    ),
    'streak_record': FirestoreSyncAdapter(
      entityType: 'streak_record',
      collectionPath: 'streak_records',
    ),
    'reflection_note': FirestoreSyncAdapter(
      entityType: 'reflection_note',
      collectionPath: 'reflection_notes',
    ),
    'favorite_bookmark': FirestoreSyncAdapter(
      entityType: 'favorite_bookmark',
      collectionPath: 'favorites_bookmarks',
    ),
    'adhkar_progress': FirestoreSyncAdapter(
      entityType: 'adhkar_progress',
      collectionPath: 'adhkar_progress',
    ),
    'notification_preference': FirestoreSyncAdapter(
      entityType: 'notification_preference',
      collectionPath: 'notification_preferences',
      documentId: _preferenceDocumentId,
    ),
    'adhan_notification_preference': FirestoreSyncAdapter(
      entityType: 'adhan_notification_preference',
      collectionPath: 'notification_preferences',
      documentId: _preferenceDocumentId,
    ),
    'prayer_settings': FirestoreSyncAdapter(
      entityType: 'prayer_settings',
      collectionPath: 'prayer_settings',
      documentId: _singletonDocumentId,
    ),
  };

  static FirestoreSyncAdapter forEntityType(String entityType) {
    final adapter = _adapters[entityType];
    if (adapter == null) {
      throw UnsupportedError('Entity type is not user-owned sync data.');
    }
    return adapter;
  }

  Future<void> push({
    required SyncOperation operation,
    required String ownerUserId,
    required FirestoreUserDataStore userDataStore,
    required SyncConflictPolicy conflictPolicy,
  }) async {
    final payload = _payloadFor(operation);
    final documentId =
        _documentId?.call(operation, payload) ??
        operation.localEntityId.toString();

    if (operation.operation == 'delete') {
      await userDataStore.deleteData(
        ownerUserId: ownerUserId,
        collectionPath: collectionPath,
        documentId: documentId,
      );
      return;
    }

    if (operation.operation != 'upsert') {
      throw UnsupportedError('Unsupported sync operation.');
    }

    final remote = await userDataStore.getData(
      ownerUserId: ownerUserId,
      collectionPath: collectionPath,
      documentId: documentId,
    );
    final merged = remote == null
        ? payload
        : conflictPolicy.merge(local: payload, remote: remote);

    await userDataStore.setData(
      ownerUserId: ownerUserId,
      collectionPath: collectionPath,
      documentId: documentId,
      data: merged,
    );
  }

  SyncPayload _payloadFor(SyncOperation operation) {
    final decoded = jsonDecode(operation.payloadJson);
    if (decoded is! Map) {
      throw const FormatException('Sync payload must be a JSON object.');
    }
    final payload = decoded.cast<String, Object?>();

    return {
      ...payload,
      'entity_type': operation.entityType,
      'local_entity_id': operation.localEntityId,
      'created_at':
          payload['created_at'] ?? operation.createdAt.toIso8601String(),
      'updated_at':
          payload['updated_at'] ?? operation.updatedAt.toIso8601String(),
    };
  }

  static String _settingsDocumentId(
    SyncOperation operation,
    SyncPayload payload,
  ) {
    return (payload['setting_key'] as String?) ??
        (payload['profile_key'] as String?) ??
        _singletonDocumentId(operation, payload);
  }

  static String _preferenceDocumentId(
    SyncOperation operation,
    SyncPayload payload,
  ) {
    return (payload['preference_key'] as String?) ??
        _singletonDocumentId(operation, payload);
  }

  static String _singletonDocumentId(
    SyncOperation operation,
    SyncPayload payload,
  ) {
    return operation.localEntityId == 0
        ? operation.entityType
        : operation.localEntityId.toString();
  }
}
