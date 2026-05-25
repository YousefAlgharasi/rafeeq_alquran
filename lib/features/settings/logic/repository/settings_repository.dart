import '../entity/app_language.dart';

abstract class SettingsRepository {
  Future<AppLanguage> getLanguage();

  Future<void> saveLanguage(AppLanguage language);

  Future<bool> getShowTranslations();

  Future<void> saveShowTranslations(bool isEnabled);
}
