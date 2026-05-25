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

  String get homeDashboardSubtitle =>
      _text(ar: 'ملخص يومك مع القرآن', en: 'Your Quran day at a glance');

  String get quran => _text(ar: 'القرآن', en: 'Quran');

  String get tafsir => _text(ar: 'التفسير', en: 'Tafsir');

  String get dailyAyah => _text(ar: 'آية اليوم', en: 'Daily Ayah');

  String get todayAyah => _text(ar: 'آية اليوم', en: "Today's ayah");

  String get openDailyAyah => _text(ar: 'فتح آية اليوم', en: 'Open daily ayah');

  String get markAyahRead => _text(ar: 'تحديدها كمقروءة', en: 'Mark as read');

  String get ayahRead => _text(ar: 'تمت القراءة', en: 'Read');

  String get dailyAyahUnavailable => _text(
    ar: 'آية اليوم غير متاحة بعد. افتح القرآن بعد تشغيل خادم المصدر المعتمد.',
    en: 'Daily ayah is not available yet. Open Quran after starting the approved source proxy.',
  );

  String get ayahTextUnavailable {
    return _text(
      ar: 'سيظهر نص الآية هنا بعد تحميله من مصدر قرآن معتمد أو من التخزين المحلي.',
      en: 'The ayah text will appear here after it loads from an approved Quran source or local cache.',
    );
  }

  String get dailyAyahUnavailableDetail {
    return _text(
      ar: 'لا يتم إنشاء نص القرآن أو التفسير داخل التطبيق. شغّل خادم المصدر المعتمد أو افتح القرآن عند توفر الاتصال ليتم حفظ المحتوى محليا.',
      en: 'Quran text and tafsir are not generated inside the app. Start the approved source proxy or open Quran when online so content can be cached locally.',
    );
  }

  String get waitingForAyah {
    return _text(ar: 'بانتظار الآية', en: 'Waiting for ayah');
  }

  String get readingProgress =>
      _text(ar: 'تقدم القراءة', en: 'Reading progress');

  String get dailyGoal => _text(ar: 'هدف اليوم', en: "Today's goal");

  String dailyGoalProgress(int completed, int target) {
    return _text(ar: '$completed / $target', en: '$completed / $target');
  }

  String get streak => _text(ar: 'السلسلة', en: 'Streak');

  String get currentStreak =>
      _text(ar: 'السلسلة الحالية', en: 'Current streak');

  String get longestStreak => _text(ar: 'أطول سلسلة', en: 'Longest streak');

  String get missedDays => _text(ar: 'أيام فائتة', en: 'Missed days');

  String get goalSettings => _text(ar: 'إعداد الهدف', en: 'Goal setting');

  String get oneAyahPerDay =>
      _text(ar: 'آية واحدة يوميا', en: 'One ayah per day');

  String get fiveAyahsPerDay =>
      _text(ar: 'خمس آيات يوميا', en: 'Five ayahs per day');

  String get onePagePerDay =>
      _text(ar: 'صفحة واحدة يوميا', en: 'One page per day');

  String get tenMinutesPerDay =>
      _text(ar: 'عشر دقائق يوميا', en: 'Ten minutes per day');

  String get adhkar => _text(ar: 'الأذكار', en: 'Adhkar');

  String get adhkarCategories =>
      _text(ar: 'تصنيفات الأذكار', en: 'Adhkar categories');

  String get adhkarShortcuts =>
      _text(ar: 'أذكار قريبة', en: 'Adhkar shortcuts');

  String get morningAdhkar => _text(ar: 'أذكار الصباح', en: 'Morning');

  String get eveningAdhkar => _text(ar: 'أذكار المساء', en: 'Evening');

  String get sleepAdhkar => _text(ar: 'أذكار النوم', en: 'Sleep');

  String get afterPrayerAdhkar => _text(ar: 'بعد الصلاة', en: 'After prayer');

  String get adhkarProgress => _text(ar: 'التقدم', en: 'Progress');

  String get adhkarCompleted => _text(ar: 'مكتمل', en: 'Completed');

  String get adhkarNoItems => _text(
    ar: 'لم تتم إضافة محتوى أذكار موثق لهذا التصنيف بعد.',
    en: 'No reviewed adhkar content has been added for this category yet.',
  );

  String get adhkarTapCounter => _text(ar: 'اضغط للعد', en: 'Tap to count');

  String adhkarCategoryProgress(int completed, int total) {
    return _text(
      ar: '$completed / $total مكتمل',
      en: '$completed / $total completed',
    );
  }

  String get prayerTimes => _text(ar: 'الصلاة', en: 'Prayer Times');

  String get nextPrayer => _text(ar: 'الصلاة القادمة', en: 'Next prayer');

  String get noPrayerTimesCached => _text(
    ar: 'لا توجد أوقات صلاة مخزنة بعد. استخدم الموقع الحالي أو أدخل المدينة والدولة.',
    en: 'No cached prayer times yet. Use current location or enter a city and country.',
  );

  String get useCurrentLocation =>
      _text(ar: 'استخدام الموقع الحالي', en: 'Use current location');

  String get currentLocationUnavailable => _text(
    ar: 'تعذر تحديد الموقع. فعّل الموقع وامنح الإذن، أو استخدم اختيار المدينة.',
    en: 'Current location is unavailable. Enable location, grant permission, or choose a city.',
  );

  String get chooseCountry => _text(ar: 'اختر الدولة', en: 'Choose country');

  String get chooseCity => _text(ar: 'اختر المدينة', en: 'Choose city');

  String get manualLocation => _text(ar: 'موقع يدوي', en: 'Manual location');

  String get city => _text(ar: 'المدينة', en: 'City');

  String get country => _text(ar: 'الدولة', en: 'Country');

  String get calculationMethod =>
      _text(ar: 'طريقة الحساب', en: 'Calculation method');

  String get madhab => _text(ar: 'مذهب العصر', en: 'Asr madhab');

  String get standardMadhab =>
      _text(ar: 'الشافعي/المالكي/الحنبلي', en: 'Standard');

  String get hanafiMadhab => _text(ar: 'الحنفي', en: 'Hanafi');

  String get savePrayerSettings =>
      _text(ar: 'حفظ إعدادات الصلاة', en: 'Save prayer settings');

  String get refreshPrayerTimes =>
      _text(ar: 'تحديث أوقات الصلاة', en: 'Refresh prayer times');

  String get hijriDate => _text(ar: 'التاريخ الهجري', en: 'Hijri date');

  String get sourceAlAdhan =>
      _text(ar: 'المصدر: AlAdhan', en: 'Source: AlAdhan');

  String get timeRemaining => _text(ar: 'الوقت المتبقي', en: 'Time remaining');

  String get todayPrayerTimes =>
      _text(ar: 'أوقات الصلاة اليوم', en: "Today's prayer times");

  String get offlineReady => _text(ar: 'متاح محليا', en: 'Offline ready');

  String get cacheLimited =>
      _text(ar: 'التخزين المحلي غير مكتمل', en: 'Cache limited');

  String get cachedContentHint => _text(
    ar: 'سيظهر المحتوى المخزن عند تعذر الاتصال.',
    en: 'Cached content is shown when connection is unavailable.',
  );

  String get offlineMode => _text(ar: 'بدون اتصال', en: 'Offline mode');

  String get offlineModeMessage => _text(
    ar: 'سيستمر التطبيق باستخدام البيانات المحفوظة وستتم مزامنة التغييرات لاحقا.',
    en: 'Using saved content. Changes will sync when connection returns.',
  );

  String get adhanNotifications =>
      _text(ar: 'تنبيهات الأذان', en: 'Adhan notifications');

  String get prePrayerNotifications =>
      _text(ar: 'تنبيه قبل الصلاة', en: 'Pre-prayer notifications');

  String get prePrayerNotificationsDescription => _text(
    ar: 'إرسال تنبيه قبل الصلاة بعشر دقائق.',
    en: 'Notify 10 minutes before each prayer.',
  );

  String get vibration => _text(ar: 'الاهتزاز', en: 'Vibration');

  String get schedulePrayerNotifications =>
      _text(ar: 'جدولة تنبيهات الصلاة', en: 'Schedule prayer notifications');

  String get notificationPermission =>
      _text(ar: 'ط¥ط°ظ† ط§ظ„طھظ†ط¨ظٹظ‡ط§طھ', en: 'Notification permission');

  String get notificationsEnabled => _text(
    ar: 'ط§ظ„طھظ†ط¨ظٹظ‡ط§طھ ظ…ظپط¹ظ„ط© ط¹ظ„ظ‰ ظ‡ط°ط§ ط§ظ„ط¬ظ‡ط§ط².',
    en: 'Notifications are enabled on this device.',
  );

  String get notificationsDisabled => _text(
    ar: 'ط§ظ„طھظ†ط¨ظٹظ‡ط§طھ ط؛ظٹط± ظ…ظپط¹ظ„ط©. ظٹظ…ظƒظ†ظƒ طھظپط¹ظٹظ„ظ‡ط§ ظ…ظ† ط¥ط¹ط¯ط§طھ ط§ظ„ط¬ظ‡ط§ط².',
    en: 'Notifications are disabled. You can enable them from device settings.',
  );

  String get enableNotifications =>
      _text(ar: 'طھظپط¹ظٹظ„ ط§ظ„طھظ†ط¨ظٹظ‡ط§طھ', en: 'Enable notifications');

  String get openNotificationSettings => _text(
    ar: 'ظپطھط­ ط¥ط¹ط¯ط§ط¯ط§طھ ط§ظ„طھظ†ط¨ظٹظ‡ط§طھ',
    en: 'Open notification settings',
  );

  String get notificationsPermissionNeeded => _text(
    ar: 'ط³ظٹطھظ… ط­ظپط¸ ط¥ط¹ط¯ط§ط¯ط§طھظƒطŒ ظ„ظƒظ† ظ„ظ† طھط¸ظ‡ط± ط§ظ„طھظ†ط¨ظٹظ‡ط§طھ ط­طھظ‰ طھظ…ظ†ط­ ط§ظ„ط¥ط°ظ†.',
    en: 'Your settings will be saved, but notifications will not appear until permission is granted.',
  );

  String get prayerNotificationsScheduled => _text(
    ar: 'تمت جدولة تنبيهات الصلاة',
    en: 'Prayer notifications scheduled',
  );

  String adhanNotificationBody(String prayerName) {
    return _text(
      ar: 'حان وقت صلاة $prayerName',
      en: 'It is time for $prayerName prayer.',
    );
  }

  String prePrayerNotificationBody(String prayerName) {
    return _text(
      ar: 'بقيت 10 دقائق على صلاة $prayerName',
      en: '$prayerName prayer is in 10 minutes.',
    );
  }

  String get debugNotifications =>
      _text(ar: 'اختبار التنبيهات', en: 'Notification test');

  String get testAdhanNow =>
      _text(ar: 'اختبار الأذان الآن', en: 'Test adhan now');

  String get testAdhanAfterFiveSeconds =>
      _text(ar: 'اختبار الأذان بعد 5 ثوان', en: 'Test adhan after 5 seconds');

  String get testPrePrayerNow =>
      _text(ar: 'اختبار قبل الصلاة الآن', en: 'Test pre-prayer now');

  String get testPrePrayerAfterFiveSeconds => _text(
    ar: 'اختبار قبل الصلاة بعد 5 ثوان',
    en: 'Test pre-prayer after 5 seconds',
  );

  String get testQuranReminder =>
      _text(ar: 'اختبار تذكير القرآن', en: 'Test Quran reminder');

  String get testVibration =>
      _text(ar: 'اختبار الاهتزاز', en: 'Test vibration');

  String get testVibrationBody =>
      _text(ar: 'هذا اختبار للاهتزاز.', en: 'This is a vibration test.');

  String get testDefaultSound =>
      _text(ar: 'اختبار الصوت الافتراضي', en: 'Test default sound');

  String get testDefaultSoundBody => _text(
    ar: 'هذا اختبار للصوت الافتراضي.',
    en: 'This is a default sound test.',
  );

  String get testAdhanSound =>
      _text(ar: 'اختبار صوت الأذان', en: 'Test adhan sound');

  String get testAdhanSoundBody => _text(
    ar: 'هذا اختبار لقناة صوت الأذان.',
    en: 'This tests the adhan sound channel.',
  );

  String get favorites => _text(ar: 'المفضلة', en: 'Favorites');

  String get allFavorites => _text(ar: 'الكل', en: 'All');

  String get noFavorites =>
      _text(ar: 'لا توجد عناصر محفوظة بعد.', en: 'No saved items yet.');

  String get addFavorite =>
      _text(ar: 'إضافة إلى المفضلة', en: 'Add to favorites');

  String get removeFavorite =>
      _text(ar: 'إزالة من المفضلة', en: 'Remove from favorites');

  String get favoriteTypeAyah => _text(ar: 'آية', en: 'Ayah');

  String get favoriteTypeTafsir => _text(ar: 'تفسير', en: 'Tafsir');

  String get favoriteTypeAdhkar => _text(ar: 'ذكر', en: 'Adhkar');

  String get favoriteTypeReflectionNote =>
      _text(ar: 'تأمل', en: 'Reflection note');

  String get reflectionNotes => _text(ar: 'تأملاتي', en: 'Reflection notes');

  String get addReflectionNote =>
      _text(ar: 'إضافة تأمل', en: 'Add reflection note');

  String get editReflectionNote =>
      _text(ar: 'تعديل التأمل', en: 'Edit reflection note');

  String get deleteReflectionNote =>
      _text(ar: 'حذف التأمل', en: 'Delete reflection note');

  String get reflectionNotePrompt => _text(
    ar: 'ماذا تعلمت من هذه الآية؟',
    en: 'What did you learn from this ayah?',
  );

  String get reflectionNotePersonalLabel =>
      _text(ar: 'ملاحظة شخصية', en: 'Personal note');

  String get reflectionNoteNotTafsir => _text(
    ar: 'هذه ملاحظتك الشخصية وليست تفسيرًا للآية.',
    en: 'This is your personal note, not a religious explanation of the ayah.',
  );

  String get noReflectionNotes => _text(
    ar: 'لا توجد تأملات محفوظة لهذه الآية بعد.',
    en: 'No reflection notes saved for this ayah yet.',
  );

  String get saveReflectionNote =>
      _text(ar: 'حفظ التأمل', en: 'Save reflection note');

  String get cancel => _text(ar: 'إلغاء', en: 'Cancel');

  String get readingBookmarks =>
      _text(ar: 'علامات القراءة', en: 'Reading bookmarks');

  String get saveReadingBookmark =>
      _text(ar: 'حفظ علامة قراءة', en: 'Save reading bookmark');

  String get readingBookmarkSaved =>
      _text(ar: 'تم حفظ علامة القراءة', en: 'Reading bookmark saved');

  String get settings => _text(ar: 'الإعدادات', en: 'Settings');

  String get language => _text(ar: 'اللغة', en: 'Language');

  String get arabic => _text(ar: 'العربية', en: 'Arabic');

  String get english => _text(ar: 'الإنجليزية', en: 'English');

  String get quranDisplay => _text(ar: 'عرض القرآن', en: 'Quran display');

  String get showTranslations =>
      _text(ar: 'إظهار الترجمة', en: 'Show translations');

  String get showTranslationsDescription => _text(
    ar: 'إظهار أو إخفاء ترجمة معاني الآيات في شاشة القرآن وآية اليوم.',
    en: 'Show or hide ayah meaning translations in Quran and Daily Ayah.',
  );

  String get prayerLocation {
    return _text(ar: 'موقع الصلاة', en: 'Prayer location');
  }

  String get reminderTimeSlots {
    return _text(ar: 'أوقات التذكير', en: 'Reminder time slots');
  }

  String get syncStatus => _text(ar: 'حالة المزامنة', en: 'Sync status');

  String get synced => _text(ar: 'تمت المزامنة', en: 'Synced');

  String pendingSyncChanges(int count) {
    return _text(
      ar: '$count تغييرات بانتظار المزامنة',
      en: '$count pending sync changes',
    );
  }

  String get quranReminders =>
      _text(ar: 'تذكيرات القرآن', en: 'Quran reminders');

  String get enableQuranReminders =>
      _text(ar: 'تفعيل تذكيرات القرآن', en: 'Enable Quran reminders');

  String get quranReminderNotificationBody => _text(
    ar: 'حان وقت قراءة وردك من القرآن.',
    en: 'It is time for your Quran reading.',
  );

  String get quranReminderSlots =>
      _text(ar: 'أوقات التذكير', en: 'Reminder slots');

  String get afterFajrReminder => _text(ar: 'بعد الفجر', en: 'After Fajr');

  String get middayReminder => _text(ar: 'منتصف اليوم', en: 'Midday');

  String get afterAsrReminder => _text(ar: 'بعد العصر', en: 'After Asr');

  String get beforeSleepReminder => _text(ar: 'قبل النوم', en: 'Before sleep');

  String get quranRemindersOn => _text(
    ar: 'سيتم تذكيرك إذا لم يكتمل هدف اليوم.',
    en: "You'll be reminded while today's goal is unfinished.",
  );

  String get quranRemindersOff => _text(
    ar: 'التذكيرات متوقفة حتى تفعلها مرة أخرى.',
    en: 'Reminders are off until you enable them again.',
  );

  String get login => _text(ar: 'تسجيل الدخول', en: 'Login');

  String get createAccount => _text(ar: 'إنشاء حساب', en: 'Create account');

  String get useExistingAccount => _text(
    ar: 'لديك حساب؟ سجل الدخول',
    en: 'Already have an account? Sign in',
  );

  String get useNewAccount => _text(
    ar: 'ليس لديك حساب؟ أنشئ حسابا',
    en: "Don't have an account? Create one",
  );

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

  String get surah => _text(ar: 'سورة', en: 'Surah');

  String get shareAyahAsImage {
    return _text(ar: 'مشاركة الآية كصورة', en: 'Share ayah as image');
  }

  String get shareAyahFailed {
    return _text(
      ar: 'تعذرت مشاركة الآية الآن.',
      en: 'Could not share the ayah right now.',
    );
  }

  String get verses => _text(ar: 'آيات', en: 'verses');

  String get playRecitation =>
      _text(ar: 'تشغيل التلاوة', en: 'Play recitation');

  String get pauseRecitation =>
      _text(ar: 'إيقاف التلاوة مؤقتا', en: 'Pause recitation');

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
      ar: 'تعذر الاتصال بخدمات الحساب الآن. وضع الضيف متاح.',
      en: 'Account services are unavailable right now. Guest mode is available.',
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
    return _text(
      ar: 'أدخل بريداً إلكترونياً صحيحاً',
      en: 'Enter a valid email',
    );
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
