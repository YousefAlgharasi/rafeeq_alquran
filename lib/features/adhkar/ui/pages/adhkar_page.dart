import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/placeholder_feature_page.dart';

class AdhkarPage extends PlaceholderFeaturePage {
  const AdhkarPage({super.key}) : super(titleBuilder: _title);

  static String _title(AppLocalizations localizations) => localizations.adhkar;
}
