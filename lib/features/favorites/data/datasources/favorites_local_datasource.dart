import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/sync/sync_status.dart';
import '../../logic/entity/favorite_type.dart';
import '../models/favorite_entry_model.dart';

abstract class FavoritesLocalDatasource {
  Future<List<FavoriteEntryModel>> getFavorites({
    required String? ownerUserId,
    FavoriteType? type,
  });

  Future<FavoriteEntryModel?> findFavorite({
    required String? ownerUserId,
    required FavoriteType type,
    required String itemKey,
  });

  Future<bool> isFavorite({
    required String? ownerUserId,
    required FavoriteType type,
    required String itemKey,
  });

  Future<FavoriteEntryModel> saveFavorite({
    required String? ownerUserId,
    required FavoriteType type,
    required String itemKey,
    String? label,
    DateTime? now,
  });

  Future<FavoriteEntryModel?> removeFavorite({
    required String? ownerUserId,
    required FavoriteType type,
    required String itemKey,
    DateTime? now,
  });
}

class DriftFavoritesLocalDatasource implements FavoritesLocalDatasource {
  const DriftFavoritesLocalDatasource(this._database);

  final AppDatabase _database;

  @override
  Future<List<FavoriteEntryModel>> getFavorites({
    required String? ownerUserId,
    FavoriteType? type,
  }) async {
    final rows =
        await (_database.select(_database.favoriteBookmarks)
              ..where((table) {
                var expression =
                    table.deletedAt.isNull() &
                    _ownerExpression(table, ownerUserId);
                if (type != null) {
                  expression = expression & table.itemType.equals(type.value);
                }
                return expression;
              })
              ..orderBy([(table) => OrderingTerm.desc(table.createdAt)]))
            .get();

    return rows.map(FavoriteEntryModel.fromRow).toList();
  }

  @override
  Future<FavoriteEntryModel?> findFavorite({
    required String? ownerUserId,
    required FavoriteType type,
    required String itemKey,
  }) async {
    final row =
        await (_database.select(_database.favoriteBookmarks)
              ..where(
                (table) =>
                    table.itemType.equals(type.value) &
                    table.itemKey.equals(itemKey) &
                    table.deletedAt.isNull() &
                    _ownerExpression(table, ownerUserId),
              )
              ..limit(1))
            .getSingleOrNull();

    return row == null ? null : FavoriteEntryModel.fromRow(row);
  }

  @override
  Future<bool> isFavorite({
    required String? ownerUserId,
    required FavoriteType type,
    required String itemKey,
  }) async {
    final row = await findFavorite(
      ownerUserId: ownerUserId,
      type: type,
      itemKey: itemKey,
    );
    return row != null;
  }

  @override
  Future<FavoriteEntryModel> saveFavorite({
    required String? ownerUserId,
    required FavoriteType type,
    required String itemKey,
    String? label,
    DateTime? now,
  }) async {
    final existing = await findFavorite(
      ownerUserId: ownerUserId,
      type: type,
      itemKey: itemKey,
    );
    if (existing != null) {
      return existing;
    }

    final timestamp = now ?? DateTime.now().toUtc();
    final id = await _database
        .into(_database.favoriteBookmarks)
        .insert(
          FavoriteBookmarksCompanion.insert(
            itemType: type.value,
            itemKey: itemKey,
            label: Value(label),
            ownerUserId: Value(ownerUserId),
            syncStatus: Value(
              ownerUserId == null ? 'local' : SyncStatus.pending.value,
            ),
            createdAt: timestamp,
            updatedAt: timestamp,
          ),
        );

    final row = await (_database.select(
      _database.favoriteBookmarks,
    )..where((table) => table.id.equals(id))).getSingle();
    return FavoriteEntryModel.fromRow(row);
  }

  @override
  Future<FavoriteEntryModel?> removeFavorite({
    required String? ownerUserId,
    required FavoriteType type,
    required String itemKey,
    DateTime? now,
  }) async {
    final existing = await findFavorite(
      ownerUserId: ownerUserId,
      type: type,
      itemKey: itemKey,
    );
    if (existing == null) {
      return null;
    }

    final timestamp = now ?? DateTime.now().toUtc();
    await (_database.update(
      _database.favoriteBookmarks,
    )..where((table) => table.id.equals(existing.id))).write(
      FavoriteBookmarksCompanion(
        deletedAt: Value(timestamp),
        updatedAt: Value(timestamp),
        syncStatus: Value(
          ownerUserId == null ? 'local' : SyncStatus.pending.value,
        ),
      ),
    );

    return existing;
  }

  Expression<bool> _ownerExpression(
    $FavoriteBookmarksTable table,
    String? ownerUserId,
  ) {
    return ownerUserId == null
        ? table.ownerUserId.isNull()
        : table.ownerUserId.equals(ownerUserId);
  }
}
