import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/features/daily_ayah/logic/daily_ayah_selector.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/quran_chapter.dart';

void main() {
  const selector = DailyAyahSelector();
  const chapters = [
    QuranChapter(
      chapterNumber: 1,
      versesCount: 3,
      source: 'verified-test-source',
    ),
    QuranChapter(
      chapterNumber: 2,
      versesCount: 3,
      source: 'verified-test-source',
    ),
  ];

  test('returns the same ayah for the same date', () {
    final date = DateTime(2026, 5, 24);

    final first = selector.select(
      date: date,
      chapters: chapters,
      recentVerseKeys: const [],
    );
    final second = selector.select(
      date: date,
      chapters: chapters,
      recentVerseKeys: const [],
    );

    expect(second.verseKey, first.verseKey);
  });

  test('avoids recent ayahs when another candidate exists', () {
    final date = DateTime(2026, 5, 24);
    final initial = selector.select(
      date: date,
      chapters: chapters,
      recentVerseKeys: const [],
    );

    final next = selector.select(
      date: date,
      chapters: chapters,
      recentVerseKeys: [initial.verseKey],
    );

    expect(next.verseKey, isNot(initial.verseKey));
  });
}
