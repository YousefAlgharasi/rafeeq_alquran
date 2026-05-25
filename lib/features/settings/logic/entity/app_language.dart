import 'package:flutter/widgets.dart';

enum AppLanguage {
  arabic('ar'),
  english('en');

  const AppLanguage(this.languageCode);

  final String languageCode;

  Locale get locale => Locale(languageCode);

  static AppLanguage fromLanguageCode(String? value) {
    return AppLanguage.values.firstWhere(
      (language) => language.languageCode == value,
      orElse: () => AppLanguage.english,
    );
  }
}
