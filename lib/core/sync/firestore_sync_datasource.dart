import 'package:cloud_firestore/cloud_firestore.dart';

import 'sync_operation.dart';

abstract class FirestoreSyncDatasource {
  Future<void> pushOperation(SyncOperation operation);
}

class CloudFirestoreSyncDatasource implements FirestoreSyncDatasource {
  CloudFirestoreSyncDatasource({
    FirebaseFirestore? firestore,
  }) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  @override
  Future<void> pushOperation(SyncOperation operation) async {
    final ownerUserId = operation.ownerUserId;
    if (ownerUserId == null) {
      throw StateError('Cannot sync an operation without an owner user id.');
    }

    await _firestore
        .collection('users')
        .doc(ownerUserId)
        .collection('sync_queue')
        .doc(operation.id.toString())
        .set({
      'entity_type': operation.entityType,
      'local_entity_id': operation.localEntityId,
      'operation': operation.operation,
      'payload_json': operation.payloadJson,
      'created_at': operation.createdAt.toIso8601String(),
      'updated_at': operation.updatedAt.toIso8601String(),
    }, SetOptions(merge: true));
  }
}
