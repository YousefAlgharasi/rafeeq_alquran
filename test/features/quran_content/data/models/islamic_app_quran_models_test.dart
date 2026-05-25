import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/features/quran_content/data/models/quran_api_models.dart';

void main() {
  test('reads islamic.app nested chapters response', () {
    final chapters =
        readObjectList(const {
          'code': 200,
          'status': 'OK',
          'data': {
            'chapters': [
              {
                'id': 1,
                'name_simple': 'Al-Fatihah',
                'name_arabic': 'الفاتحة',
                'verses_count': 7,
                'translated_name': {
                  'language_name': 'en',
                  'name': 'The Opener',
                },
              },
            ],
          },
        }, 'chapters').map((json) {
          return QuranApiChapterModel.fromJson(json, source: islamicAppSource);
        }).toList();

    expect(chapters.single.chapterNumber, 1);
    expect(chapters.single.versesCount, 7);
    expect(chapters.single.nameEnglish, 'Al-Fatihah');
    expect(chapters.single.source, islamicAppSource);
  });

  test(
    'reads islamic.app nested verses response and strips translation HTML',
    () {
      final verses =
          readObjectList(const {
            'code': 200,
            'status': 'OK',
            'data': {
              'verses': [
                {
                  'id': 1,
                  'verse_number': 1,
                  'verse_key': '1:1',
                  'chapter_id': 1,
                  'text_uthmani': 'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
                  'translations': [
                    {
                      'slug': 'en-sahih-international',
                      'resource_name': 'Saheeh International',
                      'text': 'In the name of Allah<sup foot_note=1>1</sup>',
                    },
                  ],
                },
              ],
            },
          }, 'verses').map((json) {
            return QuranApiVerseModel.fromJson(json, source: islamicAppSource);
          }).toList();

      expect(verses.single.verseKey, '1:1');
      expect(verses.single.chapterNumber, 1);
      expect(verses.single.verseNumber, 1);
      expect(
        verses.single.textArabic,
        'بِسْمِ اللَّهِ الرَّحْمَٰنِ الرَّحِيمِ',
      );
      expect(verses.single.translationText, 'In the name of Allah');
      expect(verses.single.translationSource, 'Saheeh International');
      expect(verses.single.source, islamicAppSource);
    },
  );
}
