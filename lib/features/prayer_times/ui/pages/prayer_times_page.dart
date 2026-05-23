import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/placeholder_feature_page.dart';

class PrayerTimesPage extends PlaceholderFeaturePage {
  const PrayerTimesPage({super.key}) : super(titleBuilder: _title);

  static String _title(AppLocalizations localizations) {
    return localizations.prayerTimes;
  }
}
