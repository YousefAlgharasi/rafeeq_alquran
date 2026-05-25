import '../../../../core/localization/app_localizations.dart';

enum FavoriteType {
  ayah('ayah'),
  tafsir('tafsir'),
  adhkar('adhkar'),
  reflectionNote('reflection_note'),
  readingBookmark('reading_bookmark');

  const FavoriteType(this.value);

  final String value;

  static FavoriteType fromValue(String value) {
    return FavoriteType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => FavoriteType.ayah,
    );
  }

  String label(AppLocalizations localizations) {
    return switch (this) {
      FavoriteType.ayah => localizations.favoriteTypeAyah,
      FavoriteType.tafsir => localizations.favoriteTypeTafsir,
      FavoriteType.adhkar => localizations.favoriteTypeAdhkar,
      FavoriteType.reflectionNote => localizations.favoriteTypeReflectionNote,
      FavoriteType.readingBookmark => localizations.readingBookmarks,
    };
  }
}
