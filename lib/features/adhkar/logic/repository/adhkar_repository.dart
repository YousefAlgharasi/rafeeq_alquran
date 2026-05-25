import '../entity/adhkar_category_entity.dart';
import '../entity/adhkar_category_progress.dart';
import '../entity/adhkar_item_entity.dart';
import '../entity/adhkar_progress_entity.dart';

abstract class AdhkarRepository {
  Future<void> importFromAssets();

  Future<List<AdhkarCategoryEntity>> getCategories();

  Future<List<AdhkarItemEntity>> getItemsForCategory(String categoryKey);

  Future<AdhkarCategoryProgress> getCategoryProgress(
    String categoryKey, {
    DateTime? date,
  });

  Future<AdhkarProgressEntity> incrementCounter(
    AdhkarItemEntity item, {
    DateTime? date,
  });
}
