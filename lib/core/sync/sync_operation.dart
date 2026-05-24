import '../database/app_database.dart';
import 'sync_status.dart';

class SyncOperation {
  const SyncOperation({
    required this.id,
    required this.ownerUserId,
    required this.entityType,
    required this.localEntityId,
    required this.operation,
    required this.payloadJson,
    required this.status,
    required this.retryCount,
    required this.createdAt,
    required this.updatedAt,
    this.lastAttemptAt,
  });

  factory SyncOperation.fromQueueRow(SyncQueueData row) {
    return SyncOperation(
      id: row.id,
      ownerUserId: row.ownerUserId,
      entityType: row.entityType,
      localEntityId: row.localEntityId,
      operation: row.operation,
      payloadJson: row.payloadJson,
      status: SyncStatus.fromValue(row.status),
      retryCount: row.retryCount,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      lastAttemptAt: row.lastAttemptAt,
    );
  }

  final int id;
  final String? ownerUserId;
  final String entityType;
  final int localEntityId;
  final String operation;
  final String payloadJson;
  final SyncStatus status;
  final int retryCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? lastAttemptAt;
}
