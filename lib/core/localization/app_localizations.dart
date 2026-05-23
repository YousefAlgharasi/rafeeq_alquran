import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocalizations {
  const AppLocalizations(this.locale);

  final Locale locale;

  static const supportedLocales = [Locale('ar'), Locale('en')];

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    AppLocalizationsDelegate(),
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static AppLocalizations of(BuildContext context) {
    final localizations = Localizations.of<AppLocalizations>(
      context,
      AppLocalizations,
    );

    assert(localizations != null, 'AppLocalizations not found in context.');
    return localizations!;
  }

  bool get isArabic => locale.languageCode == 'ar';

  TextDirection get textDirection {
    return isArabic ? TextDirection.rtl : TextDirection.ltr;
  }

  String get appName => _text(ar: 'رفيق القرآن', en: 'Rafeeq Al Quran');

  String get home => _text(ar: 'الرئيسية', en: 'Home');

  String get quran => _text(ar: 'القرآن', en: 'Quran');

  String get dailyAyah => _text(ar: 'آية اليوم', en: 'Daily Ayah');

  String get adhkar => _text(ar: 'الأذكار', en: 'Adhkar');

  String get prayerTimes => _text(ar: 'الصلاة', en: 'Prayer Times');

  String get favorites => _text(ar: 'المفضلة', en: 'Favorites');

  String get settings => _text(ar: 'الإعدادات', en: 'Settings');

  String get placeholderBody => _text(
    ar: 'هذه صفحة تمهيدية. سيتم تنفيذ الميزة في مهمة لاحقة.',
    en: 'This is a placeholder page. The feature will be implemented in a later task.',
  );

  String get scaffoldReady =>
      _text(ar: 'الواجهة الأساسية جاهزة', en: 'App shell is ready');

  String _text({required String ar, required String en}) {
    return isArabic ? ar : en;
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return AppLocalizations.supportedLocales
        .map((supportedLocale) => supportedLocale.languageCode)
        .contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
