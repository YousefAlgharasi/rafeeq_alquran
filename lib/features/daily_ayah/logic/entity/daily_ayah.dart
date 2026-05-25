import '../../../quran_content/logic/entity/quran_audio_metadata.dart';
import '../../../quran_content/logic/entity/quran_verse.dart';
import '../../../tafsir/logic/entity/tafsir_entry.dart';

class DailyAyah {
  const DailyAyah({
    required this.selectedDate,
    required this.verse,
    required this.wasRead,
    this.tafsir,
    this.audioMetadata = const [],
  });

  final DateTime selectedDate;
  final QuranVerse verse;
  final TafsirEntry? tafsir;
  final List<QuranAudioMetadata> audioMetadata;
  final bool wasRead;
}
