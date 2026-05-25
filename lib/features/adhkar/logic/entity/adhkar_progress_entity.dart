class AdhkarProgressEntity {
  const AdhkarProgressEntity({
    required this.id,
    required this.itemKey,
    required this.progressDate,
    required this.currentCount,
    required this.isCompleted,
    this.ownerUserId,
  });

  final int id;
  final String itemKey;
  final DateTime progressDate;
  final int currentCount;
  final bool isCompleted;
  final String? ownerUserId;
}
