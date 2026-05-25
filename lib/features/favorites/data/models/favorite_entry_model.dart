import '../../../../core/database/app_database.dart';
import '../../logic/entity/favorite_entry.dart';
import '../../logic/entity/favorite_type.dart';

class FavoriteEntryModel extends FavoriteEntry {
  const FavoriteEntryModel({
    required super.id,
    required super.type,
    required super.itemKey,
    required super.createdAt,
    required super.updatedAt,
    required super.syncStatus,
    super.label,
    super.ownerUserId,
    super.firebaseId,
  });

  factory FavoriteEntryModel.fromRow(FavoriteBookmark row) {
    return FavoriteEntryModel(
      id: row.id,
      type: FavoriteType.fromValue(row.itemType),
      itemKey: row.itemKey,
      label: row.label,
      ownerUserId: row.ownerUserId,
      firebaseId: row.firebaseId,
      syncStatus: row.syncStatus,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  Map<String, Object?> toSyncJson() {
    return {
      'id': id,
      'itemType': type.value,
      'itemKey': itemKey,
      'label': label,
      'ownerUserId': ownerUserId,
      'firebaseId': firebaseId,
      'syncStatus': syncStatus,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
