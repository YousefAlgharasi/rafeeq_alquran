import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/core/database/app_database.dart';
import 'package:rafeeq_alquran/features/favorites/data/datasources/favorites_local_datasource.dart';
import 'package:rafeeq_alquran/features/favorites/logic/entity/favorite_type.dart';

void main() {
  late AppDatabase database;
  late DriftFavoritesLocalDatasource datasource;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    datasource = DriftFavoritesLocalDatasource(database);
  });

  tearDown(() async {
    await database.close();
  });

  test('saves and soft deletes guest favorites locally', () async {
    await datasource.saveFavorite(
      ownerUserId: null,
      type: FavoriteType.ayah,
      itemKey: '1:1',
      label: '1:1',
      now: DateTime(2026, 5, 25),
    );

    expect(
      await datasource.isFavorite(
        ownerUserId: null,
        type: FavoriteType.ayah,
        itemKey: '1:1',
      ),
      isTrue,
    );

    final favorites = await datasource.getFavorites(ownerUserId: null);
    expect(favorites.single.syncStatus, 'local');
    expect(favorites.single.ownerUserId, isNull);

    await datasource.removeFavorite(
      ownerUserId: null,
      type: FavoriteType.ayah,
      itemKey: '1:1',
      now: DateTime(2026, 5, 25, 1),
    );

    expect(await datasource.getFavorites(ownerUserId: null), isEmpty);
  });

  test('logged-in favorites are owner scoped and sync-ready', () async {
    await datasource.saveFavorite(
      ownerUserId: 'user-a',
      type: FavoriteType.readingBookmark,
      itemKey: '2:5',
      label: '2:5',
      now: DateTime(2026, 5, 25),
    );

    final userFavorites = await datasource.getFavorites(ownerUserId: 'user-a');
    final guestFavorites = await datasource.getFavorites(ownerUserId: null);

    expect(userFavorites.single.type, FavoriteType.readingBookmark);
    expect(userFavorites.single.syncStatus, 'pending');
    expect(guestFavorites, isEmpty);
  });
}
