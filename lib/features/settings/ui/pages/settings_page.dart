import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/placeholder_feature_page.dart';

class SettingsPage extends PlaceholderFeaturePage {
  const SettingsPage({super.key}) : super(titleBuilder: _title);

  static String _title(AppLocalizations localizations) {
    return localizations.settings;
  }
}
