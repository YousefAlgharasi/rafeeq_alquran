class QuranTafsir {
  const QuranTafsir({
    required this.verseKey,
    required this.resourceId,
    required this.languageCode,
    required this.source,
    this.text,
  });

  final String verseKey;
  final String resourceId;
  final String languageCode;
  final String source;
  final String? text;
}
