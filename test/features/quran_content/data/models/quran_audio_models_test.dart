import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/features/quran_content/data/models/quran_api_models.dart';

void main() {
  test('maps Quran audio metadata from approved proxy response', () {
    final metadata = QuranApiAudioMetadataModel.fromJson(
      const {
        'verse_key': '1:1',
        'audio_url': 'https://approved.example/audio/1-1.mp3',
      },
      reciterId: '7',
    );

    expect(metadata.reciterId, '7');
    expect(metadata.verseKey, '1:1');
    expect(metadata.remoteUrl, 'https://approved.example/audio/1-1.mp3');
    expect(metadata.source, quranFoundationSource);
  });

  test('maps Quran reciter metadata from approved proxy response', () {
    final reciter = QuranApiReciterModel.fromJson(
      const {
        'id': 7,
        'reciter_name': 'Approved reciter',
        'style': 'Murattal',
      },
    );

    expect(reciter.id, '7');
    expect(reciter.nameEnglish, 'Approved reciter');
    expect(reciter.style, 'Murattal');
    expect(reciter.source, quranFoundationSource);
  });
}
