import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database_provider.dart';
import '../../../quran_content/logic/provider/quran_content_provider.dart';
import '../../../tafsir/logic/provider/tafsir_provider.dart';
import '../../data/datasources/daily_ayah_local_datasource.dart';
import '../../data/repository/repo_impl/daily_ayah_repository_impl.dart';
import '../entity/daily_ayah.dart';
import '../repository/daily_ayah_repository.dart';

final dailyAyahLocalDatasourceProvider = Provider<DailyAyahLocalDatasource>((
  ref,
) {
  return DriftDailyAyahLocalDatasource(ref.watch(appDatabaseProvider));
});

final dailyAyahRepositoryProvider = Provider<DailyAyahRepository>((ref) {
  return DailyAyahRepositoryImpl(
    localDatasource: ref.watch(dailyAyahLocalDatasourceProvider),
    quranRepository: ref.watch(quranContentRepositoryProvider),
    tafsirRepository: ref.watch(tafsirRepositoryProvider),
  );
});

final dailyAyahProvider = FutureProvider<DailyAyah>((ref) {
  return ref.watch(dailyAyahRepositoryProvider).getDailyAyah();
});
