import 'dart:convert';

import '../../../../../core/sync/sync_queue_manager.dart';
import '../../../../auth/logic/entity/auth_session.dart';
import '../../../logic/entity/favorite_entry.dart';
import '../../../logic/entity/favorite_type.dart';
import '../../../logic/entity/reading_bookmark.dart';
import '../../../logic/repository/favorites_repository.dart';
import '../../datasources/favorites_local_datasource.dart';
import '../../models/favorite_entry_model.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  const FavoritesRepositoryImpl({
    required FavoritesLocalDatasource localDatasource,
    required SyncQueueManager syncQueueManager,
    required AuthSession session,
  }) : _localDatasource = localDatasource,
       _syncQueueManager = syncQueueManager,
       _session = session;

  final FavoritesLocalDatasource _localDatasource;
  final SyncQueueManager _syncQueueManager;
  final AuthSession _session;

  String? get _ownerUserId => _session.user?.id;

  @override
  Future<List<FavoriteEntry>> getFavorites({FavoriteType? type}) {
    return _localDatasource.getFavorites(ownerUserId: _ownerUserId, type: type);
  }

  @override
  Future<bool> isFavorite({
    required FavoriteType type,
    required String itemKey,
  }) {
    return _localDatasource.isFavorite(
      ownerUserId: _ownerUserId,
      type: type,
      itemKey: itemKey,
    );
  }

  @override
  Future<FavoriteEntry> addFavorite({
    required FavoriteType type,
    required String itemKey,
    String? label,
  }) async {
    final entry = await _localDatasource.saveFavorite(
      ownerUserId: _ownerUserId,
      type: type,
      itemKey: itemKey,
      label: label,
    );
    await _enqueue(entry, 'upsert');
    return entry;
  }

  @override
  Future<FavoriteEntry?> removeFavorite({
    required FavoriteType type,
    required String itemKey,
  }) async {
    final entry = await _localDatasource.removeFavorite(
      ownerUserId: _ownerUserId,
      type: type,
      itemKey: itemKey,
    );
    if (entry != null) {
      await _enqueue(entry, 'delete');
    }
    return entry;
  }

  @override
  Future<bool> toggleFavorite({
    required FavoriteType type,
    required String itemKey,
    String? label,
  }) async {
    final isSaved = await isFavorite(type: type, itemKey: itemKey);
    if (isSaved) {
      await removeFavorite(type: type, itemKey: itemKey);
      return false;
    }

    await addFavorite(type: type, itemKey: itemKey, label: label);
    return true;
  }

  @override
  Future<ReadingBookmark> saveReadingBookmark({
    required String verseKey,
    String? label,
  }) async {
    await addFavorite(
      type: FavoriteType.readingBookmark,
      itemKey: verseKey,
      label: label,
    );
    return ReadingBookmark(
      verseKey: verseKey,
      label: label,
      savedAt: DateTime.now().toUtc(),
    );
  }

  Future<void> _enqueue(FavoriteEntry entry, String operation) async {
    if (entry is! FavoriteEntryModel) {
      return;
    }
    await _syncQueueManager.enqueueLocalChange(
      session: _session,
      entityType: 'favorite_bookmark',
      localEntityId: entry.id,
      operation: operation,
      payloadJson: jsonEncode(entry.toSyncJson()),
    );
  }
}
