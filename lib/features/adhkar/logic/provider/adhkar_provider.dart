import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database_provider.dart';
import '../../../../core/sync/sync_providers.dart';
import '../../../auth/logic/entity/auth_session.dart';
import '../../../auth/logic/provider/auth_provider.dart';
import '../../data/datasources/adhkar_asset_datasource.dart';
import '../../data/datasources/adhkar_local_datasource.dart';
import '../../data/repository/repo_impl/adhkar_repository_impl.dart';
import '../entity/adhkar_category_entity.dart';
import '../entity/adhkar_category_progress.dart';
import '../entity/adhkar_item_entity.dart';
import '../entity/adhkar_progress_entity.dart';
import '../repository/adhkar_repository.dart';

final adhkarAssetDatasourceProvider = Provider<AdhkarAssetDatasource>((ref) {
  return const RootBundleAdhkarAssetDatasource();
});

final adhkarLocalDatasourceProvider = Provider<AdhkarLocalDatasource>((ref) {
  return DriftAdhkarLocalDatasource(ref.watch(appDatabaseProvider));
});

final adhkarRepositoryProvider = Provider<AdhkarRepository>((ref) {
  return AdhkarRepositoryImpl(
    assetDatasource: ref.watch(adhkarAssetDatasourceProvider),
    localDatasource: ref.watch(adhkarLocalDatasourceProvider),
    syncQueueManager: ref.watch(syncQueueManagerProvider),
    session: ref.watch(authSessionProvider).value ?? const AuthSession.guest(),
  );
});

final adhkarBootstrapProvider = FutureProvider<void>((ref) {
  return ref.watch(adhkarRepositoryProvider).importFromAssets();
});

final adhkarCategoriesProvider = FutureProvider<List<AdhkarCategoryEntity>>((
  ref,
) async {
  await ref.watch(adhkarBootstrapProvider.future);
  return ref.watch(adhkarRepositoryProvider).getCategories();
});

final adhkarCategoryProgressProvider = FutureProvider.family
    .autoDispose<AdhkarCategoryProgress, String>((ref, categoryKey) async {
      await ref.watch(adhkarBootstrapProvider.future);
      return ref
          .watch(adhkarRepositoryProvider)
          .getCategoryProgress(categoryKey);
    });

final adhkarAllCategoryProgressProvider =
    FutureProvider.autoDispose<List<AdhkarCategoryProgress>>((ref) async {
      final categories = await ref.watch(adhkarCategoriesProvider.future);
      final repository = ref.watch(adhkarRepositoryProvider);
      return Future.wait(
        categories.map(
          (category) => repository.getCategoryProgress(category.key),
        ),
      );
    });

final adhkarCounterControllerProvider =
    Provider.autoDispose<AdhkarCounterController>((ref) {
      return AdhkarCounterController(ref);
    });

class AdhkarCounterController {
  const AdhkarCounterController(this._ref);

  final Ref _ref;

  Future<AdhkarProgressEntity> increment(AdhkarItemEntity item) async {
    final progress = await _ref
        .read(adhkarRepositoryProvider)
        .incrementCounter(item);
    _ref.invalidate(adhkarCategoriesProvider);
    _ref.invalidate(adhkarAllCategoryProgressProvider);
    _ref.invalidate(adhkarCategoryProgressProvider(item.categoryKey));
    return progress;
  }
}
