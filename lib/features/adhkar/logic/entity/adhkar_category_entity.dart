import 'adhkar_item_entity.dart';

class AdhkarCategoryEntity {
  const AdhkarCategoryEntity({
    required this.key,
    required this.titleArabic,
    required this.titleEnglish,
    required this.source,
    required this.items,
  });

  final String key;
  final String titleArabic;
  final String? titleEnglish;
  final String source;
  final List<AdhkarItemEntity> items;
}
