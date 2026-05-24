typedef SyncPayload = Map<String, Object?>;

abstract class SyncConflictPolicy {
  SyncPayload merge({
    required SyncPayload local,
    required SyncPayload remote,
  });
}

class LastWriteWinsConflictPolicy implements SyncConflictPolicy {
  const LastWriteWinsConflictPolicy();

  @override
  SyncPayload merge({
    required SyncPayload local,
    required SyncPayload remote,
  }) {
    final localUpdatedAt = _readUpdatedAt(local);
    final remoteUpdatedAt = _readUpdatedAt(remote);

    if (localUpdatedAt == null) {
      return remote;
    }
    if (remoteUpdatedAt == null) {
      return local;
    }

    return localUpdatedAt.isAfter(remoteUpdatedAt) ? local : remote;
  }

  DateTime? _readUpdatedAt(SyncPayload payload) {
    final value = payload['updated_at'] ?? payload['updatedAt'];
    if (value is DateTime) {
      return value;
    }
    if (value is String) {
      return DateTime.tryParse(value);
    }
    return null;
  }
}
