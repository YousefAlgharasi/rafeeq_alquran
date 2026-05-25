import 'favorite_type.dart';

class FavoriteEntry {
  const FavoriteEntry({
    required this.id,
    required this.type,
    required this.itemKey,
    required this.createdAt,
    required this.updatedAt,
    required this.syncStatus,
    this.label,
    this.ownerUserId,
    this.firebaseId,
  });

  final int id;
  final FavoriteType type;
  final String itemKey;
  final String? label;
  final String? ownerUserId;
  final String? firebaseId;
  final String syncStatus;
  final DateTime createdAt;
  final DateTime updatedAt;

  bool get isReadingBookmark => type == FavoriteType.readingBookmark;
}
