import 'tafsir_level.dart';

class TafsirEntry {
  const TafsirEntry({
    required this.verseKey,
    required this.resourceId,
    required this.resourceName,
    required this.level,
    required this.languageCode,
    required this.text,
    required this.source,
  });

  final String verseKey;
  final String resourceId;
  final String resourceName;
  final TafsirLevel level;
  final String languageCode;
  final String text;
  final String source;
}
