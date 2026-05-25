import '../../../quran_content/logic/entity/quran_verse.dart';
import '../../../tafsir/logic/entity/tafsir_entry.dart';

class ShareAyahContent {
  const ShareAyahContent({
    required this.verse,
    required this.surahName,
    this.tafsir,
  });

  final QuranVerse verse;
  final String surahName;
  final TafsirEntry? tafsir;

  bool get hasVerifiedTafsir {
    final entry = tafsir;
    return entry != null &&
        entry.text.trim().isNotEmpty &&
        entry.source.trim().isNotEmpty &&
        entry.resourceId.trim().isNotEmpty;
  }

  String? get tafsirSnippet {
    if (!hasVerifiedTafsir) {
      return null;
    }

    final text = tafsir!.text.trim();
    const maxLength = 180;
    if (text.length <= maxLength) {
      return text;
    }

    return '${text.substring(0, maxLength).trimRight()}...';
  }
}
