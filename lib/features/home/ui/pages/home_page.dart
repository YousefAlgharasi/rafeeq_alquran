import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/placeholder_feature_page.dart';

class HomePage extends PlaceholderFeaturePage {
  const HomePage({super.key}) : super(titleBuilder: _title);

  static String _title(AppLocalizations localizations) => localizations.home;
}
