enum SyncStatus {
  pending('pending'),
  inProgress('in_progress'),
  completed('completed'),
  failed('failed');

  const SyncStatus(this.value);

  final String value;

  static SyncStatus fromValue(String value) {
    return SyncStatus.values.firstWhere(
      (status) => status.value == value,
      orElse: () => SyncStatus.pending,
    );
  }
}
