import '../../../quran_content/logic/entity/quran_audio_metadata.dart';
import '../../../quran_content/logic/entity/quran_verse.dart';
import '../../../tafsir/logic/entity/tafsir_entry.dart';
import '../../logic/entity/daily_ayah.dart';

class DailyAyahModel extends DailyAyah {
  const DailyAyahModel({
    required super.selectedDate,
    required super.verse,
    required super.wasRead,
    super.tafsir,
    super.audioMetadata,
  });

  factory DailyAyahModel.fromParts({
    required DateTime selectedDate,
    required QuranVerse verse,
    required bool wasRead,
    TafsirEntry? tafsir,
    List<QuranAudioMetadata> audioMetadata = const [],
  }) {
    return DailyAyahModel(
      selectedDate: selectedDate,
      verse: verse,
      tafsir: tafsir,
      audioMetadata: audioMetadata,
      wasRead: wasRead,
    );
  }
}
