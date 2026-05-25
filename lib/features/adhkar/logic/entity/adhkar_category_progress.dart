import 'adhkar_category_entity.dart';
import 'adhkar_item_progress.dart';

class AdhkarCategoryProgress {
  const AdhkarCategoryProgress({required this.category, required this.items});

  final AdhkarCategoryEntity category;
  final List<AdhkarItemProgress> items;

  int get completedItems =>
      items.where((itemProgress) => itemProgress.isCompleted).length;

  int get totalItems => items.length;

  bool get isCompleted => totalItems > 0 && completedItems == totalItems;

  double get progressValue {
    if (totalItems == 0) {
      return 0;
    }
    return completedItems / totalItems;
  }
}
