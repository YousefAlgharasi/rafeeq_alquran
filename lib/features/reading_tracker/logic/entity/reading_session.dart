class ReadingSession {
  const ReadingSession({
    required this.sessionDate,
    required this.startedAt,
    required this.ayahCount,
    required this.pageCount,
    required this.durationMinutes,
    this.endedAt,
    this.startVerseKey,
    this.endVerseKey,
  });

  final DateTime sessionDate;
  final DateTime startedAt;
  final DateTime? endedAt;
  final int ayahCount;
  final int pageCount;
  final int durationMinutes;
  final String? startVerseKey;
  final String? endVerseKey;
}
