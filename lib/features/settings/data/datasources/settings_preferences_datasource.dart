import 'package:shared_preferences/shared_preferences.dart';

import '../../logic/entity/app_language.dart';

abstract class SettingsPreferencesDatasource {
  Future<AppLanguage> getLanguage();

  Future<void> saveLanguage(AppLanguage language);

  Future<bool> getShowTranslations();

  Future<void> saveShowTranslations(bool isEnabled);
}

class SharedPreferencesSettingsDatasource
    implements SettingsPreferencesDatasource {
  const SharedPreferencesSettingsDatasource();

  static const _languageKey = 'settings.language_code';
  static const _showTranslationsKey = 'settings.show_translations';

  @override
  Future<AppLanguage> getLanguage() async {
    final preferences = await SharedPreferences.getInstance();
    return AppLanguage.fromLanguageCode(preferences.getString(_languageKey));
  }

  @override
  Future<void> saveLanguage(AppLanguage language) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(_languageKey, language.languageCode);
  }

  @override
  Future<bool> getShowTranslations() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool(_showTranslationsKey) ?? true;
  }

  @override
  Future<void> saveShowTranslations(bool isEnabled) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_showTranslationsKey, isEnabled);
  }
}
