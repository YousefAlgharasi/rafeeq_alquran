import '../entity/favorite_entry.dart';
import '../entity/favorite_type.dart';
import '../entity/reading_bookmark.dart';

abstract class FavoritesRepository {
  Future<List<FavoriteEntry>> getFavorites({FavoriteType? type});

  Future<bool> isFavorite({
    required FavoriteType type,
    required String itemKey,
  });

  Future<FavoriteEntry> addFavorite({
    required FavoriteType type,
    required String itemKey,
    String? label,
  });

  Future<FavoriteEntry?> removeFavorite({
    required FavoriteType type,
    required String itemKey,
  });

  Future<bool> toggleFavorite({
    required FavoriteType type,
    required String itemKey,
    String? label,
  });

  Future<ReadingBookmark> saveReadingBookmark({
    required String verseKey,
    String? label,
  });
}
