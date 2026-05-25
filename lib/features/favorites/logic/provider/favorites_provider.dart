import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database_provider.dart';
import '../../../../core/sync/sync_providers.dart';
import '../../../auth/logic/entity/auth_session.dart';
import '../../../auth/logic/provider/auth_provider.dart';
import '../../data/datasources/favorites_local_datasource.dart';
import '../../data/repository/repo_impl/favorites_repository_impl.dart';
import '../entity/favorite_entry.dart';
import '../entity/favorite_type.dart';
import '../repository/favorites_repository.dart';

class FavoriteStatusRequest {
  const FavoriteStatusRequest({required this.type, required this.itemKey});

  final FavoriteType type;
  final String itemKey;

  @override
  bool operator ==(Object other) {
    return other is FavoriteStatusRequest &&
        other.type == type &&
        other.itemKey == itemKey;
  }

  @override
  int get hashCode => Object.hash(type, itemKey);
}

final favoritesLocalDatasourceProvider = Provider<FavoritesLocalDatasource>((
  ref,
) {
  return DriftFavoritesLocalDatasource(ref.watch(appDatabaseProvider));
});

final favoritesRepositoryProvider = Provider<FavoritesRepository>((ref) {
  return FavoritesRepositoryImpl(
    localDatasource: ref.watch(favoritesLocalDatasourceProvider),
    syncQueueManager: ref.watch(syncQueueManagerProvider),
    session: ref.watch(authSessionProvider).value ?? const AuthSession.guest(),
  );
});

final favoritesProvider = FutureProvider.autoDispose
    .family<List<FavoriteEntry>, FavoriteType?>((ref, type) {
      return ref.watch(favoritesRepositoryProvider).getFavorites(type: type);
    });

final favoriteStatusProvider = FutureProvider.autoDispose
    .family<bool, FavoriteStatusRequest>((ref, request) {
      return ref
          .watch(favoritesRepositoryProvider)
          .isFavorite(type: request.type, itemKey: request.itemKey);
    });

final favoritesControllerProvider = Provider.autoDispose<FavoritesController>((
  ref,
) {
  return FavoritesController(ref);
});

class FavoritesController {
  const FavoritesController(this._ref);

  final Ref _ref;

  Future<bool> toggle({
    required FavoriteType type,
    required String itemKey,
    String? label,
  }) async {
    final isSaved = await _ref
        .read(favoritesRepositoryProvider)
        .toggleFavorite(type: type, itemKey: itemKey, label: label);
    _invalidate(type, itemKey);
    return isSaved;
  }

  Future<void> saveReadingBookmark({
    required String verseKey,
    String? label,
  }) async {
    await _ref
        .read(favoritesRepositoryProvider)
        .saveReadingBookmark(verseKey: verseKey, label: label);
    _invalidate(FavoriteType.readingBookmark, verseKey);
  }

  void _invalidate(FavoriteType type, String itemKey) {
    _ref.invalidate(favoritesProvider(null));
    _ref.invalidate(favoritesProvider(type));
    _ref.invalidate(
      favoriteStatusProvider(
        FavoriteStatusRequest(type: type, itemKey: itemKey),
      ),
    );
  }
}
