import 'tafsir_level.dart';

class TafsirResource {
  const TafsirResource({
    required this.id,
    required this.name,
    required this.level,
    required this.isAvailable,
    required this.source,
  });

  final String id;
  final String name;
  final TafsirLevel level;
  final bool isAvailable;
  final String source;
}
