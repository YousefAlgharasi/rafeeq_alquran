import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/placeholder_feature_page.dart';

class DailyAyahPage extends PlaceholderFeaturePage {
  const DailyAyahPage({super.key}) : super(titleBuilder: _title);

  static String _title(AppLocalizations localizations) {
    return localizations.dailyAyah;
  }
}
