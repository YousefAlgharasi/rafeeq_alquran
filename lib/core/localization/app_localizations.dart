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

  String get tafsir => _text(ar: 'التفسير', en: 'Tafsir');

  String get dailyAyah => _text(ar: 'آية اليوم', en: 'Daily Ayah');

  String get adhkar => _text(ar: 'الأذكار', en: 'Adhkar');

  String get prayerTimes => _text(ar: 'الصلاة', en: 'Prayer Times');

  String get favorites => _text(ar: 'المفضلة', en: 'Favorites');

  String get settings => _text(ar: 'الإعدادات', en: 'Settings');

  String get login => _text(ar: 'تسجيل الدخول', en: 'Login');

  String get profile => _text(ar: 'الملف الشخصي', en: 'Profile');

  String get logout => _text(ar: 'تسجيل الخروج', en: 'Logout');

  String get continueAsGuest {
    return _text(ar: 'المتابعة كضيف', en: 'Continue as guest');
  }

  String get guestMode => _text(ar: 'وضع الضيف', en: 'Guest mode');

  String get loggedIn => _text(ar: 'تم تسجيل الدخول', en: 'Logged in');

  String get email => _text(ar: 'البريد الإلكتروني', en: 'Email');

  String get password => _text(ar: 'كلمة المرور', en: 'Password');

  String get account => _text(ar: 'الحساب', en: 'Account');

  String get openProfile => _text(ar: 'فتح الملف الشخصي', en: 'Open profile');

  String get surahs => _text(ar: 'السور', en: 'Surahs');

  String get verses => _text(ar: 'آيات', en: 'verses');

  String get continueReading =>
      _text(ar: 'متابعة القراءة', en: 'Continue reading');

  String get noCachedQuran => _text(
        ar: 'لا توجد بيانات قرآن مخزنة بعد. شغّل خادم القرآن ثم أعد المحاولة.',
        en: 'No cached Quran content yet. Start the Quran proxy, then try again.',
      );

  String get comingSoon => _text(ar: 'قريباً', en: 'Coming soon');

  String get tafsirUnavailable {
    return _text(
      ar: 'التفسير الميسر غير متاح الآن من المصدر المعتمد.',
      en: 'Al-Muyassar is not available right now from the approved source.',
    );
  }

  String get tafsirLevelUnavailable {
    return _text(
      ar: 'هذا المستوى غير متاح حتى يتم اعتماد مصدر موثوق له.',
      en: 'This level is unavailable until a verified source is approved.',
    );
  }

  String get tafsirOpenFromAyah {
    return _text(
      ar: 'افتح التفسير من داخل صفحة قراءة السورة عند كل آية.',
      en: 'Open tafsir from each ayah inside the surah reading page.',
    );
  }

  String get retry => _text(ar: 'إعادة المحاولة', en: 'Retry');

  String get lastRead => _text(ar: 'آخر قراءة', en: 'Last read');

  String get saved => _text(ar: 'تم الحفظ', en: 'Saved');

  String get loginOptionalMessage {
    return _text(
      ar: 'يمكنك استخدام التطبيق كضيف. ستبقى بيانات الضيف محفوظة محلياً فقط.',
      en: 'You can use the app as a guest. Guest data stays local-only.',
    );
  }

  String get firebaseNotConfiguredMessage {
    return _text(
      ar: 'لم يتم إعداد Firebase بعد. وضع الضيف متاح الآن.',
      en: 'Firebase is not configured yet. Guest mode is available now.',
    );
  }

  String get syncLaterMessage {
    return _text(
      ar: 'مزامنة بيانات الحساب ستنفذ في مهمة لاحقة.',
      en: 'Account data sync will be implemented in a later task.',
    );
  }

  String get placeholderBody {
    return _text(
      ar: 'هذه صفحة تمهيدية. سيتم تنفيذ الميزة في مهمة لاحقة.',
      en: 'This is a placeholder page. The feature will be implemented in a later task.',
    );
  }

  String get scaffoldReady {
    return _text(ar: 'الواجهة الأساسية جاهزة', en: 'App shell is ready');
  }

  String get requiredField {
    return _text(ar: 'هذا الحقل مطلوب', en: 'This field is required');
  }

  String get invalidEmail {
    return _text(ar: 'أدخل بريداً إلكترونياً صحيحاً', en: 'Enter a valid email');
  }

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
