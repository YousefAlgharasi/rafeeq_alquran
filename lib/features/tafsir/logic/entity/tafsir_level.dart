enum TafsirLevel {
  shortMeaning,
  alMuyassar,
  full,
}

extension TafsirLevelLabel on TafsirLevel {
  String label({required bool isArabic}) {
    return switch (this) {
      TafsirLevel.shortMeaning => isArabic ? 'مختصر' : 'Short meaning',
      TafsirLevel.alMuyassar => isArabic ? 'التفسير الميسر' : 'Al-Muyassar',
      TafsirLevel.full => isArabic ? 'تفسير كامل' : 'Full tafsir',
    };
  }
}
