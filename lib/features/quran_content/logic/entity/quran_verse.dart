class QuranVerse {
  const QuranVerse({
    required this.verseKey,
    required this.chapterNumber,
    required this.verseNumber,
    required this.source,
    required this.textArabic,
    this.translationText,
    this.translationSource,
  });

  final String verseKey;
  final int chapterNumber;
  final int verseNumber;
  final String source;
  final String textArabic;
  final String? translationText;
  final String? translationSource;
}
