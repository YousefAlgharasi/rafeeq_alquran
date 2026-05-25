import 'dart:convert';

import '../../../../../core/sync/sync_queue_manager.dart';
import '../../../../auth/logic/entity/auth_session.dart';
import '../../../data/datasources/adhkar_asset_datasource.dart';
import '../../../data/datasources/adhkar_local_datasource.dart';
import '../../../logic/entity/adhkar_category_entity.dart';
import '../../../logic/entity/adhkar_category_progress.dart';
import '../../../logic/entity/adhkar_item_entity.dart';
import '../../../logic/entity/adhkar_progress_entity.dart';
import '../../../logic/repository/adhkar_repository.dart';

class AdhkarRepositoryImpl implements AdhkarRepository {
  const AdhkarRepositoryImpl({
    required AdhkarAssetDatasource assetDatasource,
    required AdhkarLocalDatasource localDatasource,
    required SyncQueueManager syncQueueManager,
    required AuthSession session,
  }) : _assetDatasource = assetDatasource,
       _localDatasource = localDatasource,
       _syncQueueManager = syncQueueManager,
       _session = session;

  final AdhkarAssetDatasource _assetDatasource;
  final AdhkarLocalDatasource _localDatasource;
  final SyncQueueManager _syncQueueManager;
  final AuthSession _session;

  @override
  Future<void> importFromAssets() async {
    final collection = await _assetDatasource.loadCollection();
    await _localDatasource.importCollection(collection);
  }

  @override
  Future<List<AdhkarCategoryEntity>> getCategories() {
    return _localDatasource.getCategories();
  }

  @override
  Future<List<AdhkarItemEntity>> getItemsForCategory(String categoryKey) {
    return _localDatasource.getItemsForCategory(categoryKey);
  }

  @override
  Future<AdhkarCategoryProgress> getCategoryProgress(
    String categoryKey, {
    DateTime? date,
  }) async {
    final categories = await getCategories();
    final category = categories.firstWhere(
      (category) => category.key == categoryKey,
      orElse: () => throw StateError('Adhkar category not found: $categoryKey'),
    );
    final items = await _localDatasource.getProgressForCategory(
      categoryKey: categoryKey,
      date: date ?? DateTime.now(),
      ownerUserId: _session.user?.id,
    );

    return AdhkarCategoryProgress(category: category, items: items);
  }

  @override
  Future<AdhkarProgressEntity> incrementCounter(
    AdhkarItemEntity item, {
    DateTime? date,
  }) async {
    final progress = await _localDatasource.incrementCounter(
      item: item,
      date: date ?? DateTime.now(),
      ownerUserId: _session.user?.id,
    );

    await _syncQueueManager.enqueueLocalChange(
      session: _session,
      entityType: 'adhkar_progress',
      localEntityId: progress.id,
      operation: 'upsert',
      payloadJson: jsonEncode({
        'item_key': progress.itemKey,
        'progress_date': progress.progressDate.toIso8601String(),
        'current_count': progress.currentCount,
        'is_completed': progress.isCompleted,
      }),
    );

    return progress;
  }
}
