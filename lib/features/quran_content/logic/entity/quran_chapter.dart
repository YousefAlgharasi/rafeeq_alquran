class QuranChapter {
  const QuranChapter({
    required this.chapterNumber,
    required this.versesCount,
    required this.source,
    this.nameArabic,
    this.nameEnglish,
  });

  final int chapterNumber;
  final int versesCount;
  final String source;
  final String? nameArabic;
  final String? nameEnglish;

  String displayName({required bool arabic}) {
    if (arabic) {
      return nameArabic ?? nameEnglish ?? chapterNumber.toString();
    }

    return nameEnglish ?? nameArabic ?? chapterNumber.toString();
  }
}
