import '../../quran_content/logic/entity/quran_chapter.dart';
import '../../quran_content/logic/entity/quran_verse.dart';

class DailyAyahSelection {
  const DailyAyahSelection({
    required this.chapterNumber,
    required this.verseNumber,
  });

  final int chapterNumber;
  final int verseNumber;

  String get verseKey => '$chapterNumber:$verseNumber';
}

class DailyAyahSelector {
  const DailyAyahSelector({this.recentWindow = 7});

  final int recentWindow;

  DailyAyahSelection select({
    required DateTime date,
    required List<QuranChapter> chapters,
    required List<String> recentVerseKeys,
  }) {
    final candidates = <DailyAyahSelection>[
      for (final chapter in chapters)
        for (var verse = 1; verse <= chapter.versesCount; verse++)
          DailyAyahSelection(
            chapterNumber: chapter.chapterNumber,
            verseNumber: verse,
          ),
    ];

    if (candidates.isEmpty) {
      throw StateError('No Quran chapters are available for daily ayah.');
    }

    final recent = recentVerseKeys.take(recentWindow).toSet();
    final allowed = candidates.length > recent.length
        ? candidates
            .where((candidate) => !recent.contains(candidate.verseKey))
            .toList()
        : candidates;
    final source = allowed.isEmpty ? candidates : allowed;
    final index = _dateSeed(date) % source.length;

    return source[index];
  }

  QuranVerse selectFromAvailableVerses({
    required DateTime date,
    required List<QuranVerse> verses,
    required List<String> recentVerseKeys,
  }) {
    if (verses.isEmpty) {
      throw StateError('No Quran verses are available for daily ayah.');
    }

    final recent = recentVerseKeys.take(recentWindow).toSet();
    final allowed = verses.length > recent.length
        ? verses.where((verse) => !recent.contains(verse.verseKey)).toList()
        : verses;
    final source = allowed.isEmpty ? verses : allowed;
    final index = _dateSeed(date) % source.length;

    return source[index];
  }

  int selectChapterIndex({
    required DateTime date,
    required int chapterCount,
  }) {
    if (chapterCount <= 0) {
      throw StateError('No Quran chapters are available for daily ayah.');
    }

    return _dateSeed(date) % chapterCount;
  }

  int _dateSeed(DateTime date) {
    final normalized = DateTime(date.year, date.month, date.day);
    return normalized.year * 10000 + normalized.month * 100 + normalized.day;
  }
}
