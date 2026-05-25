class ReadingBookmark {
  const ReadingBookmark({
    required this.verseKey,
    required this.savedAt,
    this.label,
  });

  final String verseKey;
  final String? label;
  final DateTime savedAt;
}
