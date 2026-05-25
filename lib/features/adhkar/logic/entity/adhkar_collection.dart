import 'adhkar_category_entity.dart';

class AdhkarCollection {
  const AdhkarCollection({
    required this.schemaVersion,
    required this.contentStatus,
    required this.reviewRequired,
    required this.reviewNote,
    required this.categories,
  });

  final int schemaVersion;
  final String contentStatus;
  final bool reviewRequired;
  final String reviewNote;
  final List<AdhkarCategoryEntity> categories;
}
