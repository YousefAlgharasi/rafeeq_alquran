class ReadingPosition {
  const ReadingPosition({
    required this.verseKey,
    required this.chapterNumber,
    required this.verseNumber,
    required this.lastReadAt,
  });

  final String verseKey;
  final int chapterNumber;
  final int verseNumber;
  final DateTime lastReadAt;
}
