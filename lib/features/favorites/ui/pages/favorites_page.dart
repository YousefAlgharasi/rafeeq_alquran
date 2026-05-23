import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/placeholder_feature_page.dart';

class FavoritesPage extends PlaceholderFeaturePage {
  const FavoritesPage({super.key}) : super(titleBuilder: _title);

  static String _title(AppLocalizations localizations) {
    return localizations.favorites;
  }
}
