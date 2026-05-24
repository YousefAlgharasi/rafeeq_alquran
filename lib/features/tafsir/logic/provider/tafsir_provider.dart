import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database_provider.dart';
import '../../../../core/network/dio_provider.dart';
import '../../../quran_content/logic/provider/quran_content_provider.dart';
import '../../data/datasources/tafsir_local_datasource.dart';
import '../../data/datasources/tafsir_remote_datasource.dart';
import '../../data/repository/repo_impl/tafsir_repository_impl.dart';
import '../entity/tafsir_entry.dart';
import '../entity/tafsir_resource.dart';
import '../repository/tafsir_repository.dart';

final tafsirRemoteDatasourceProvider = Provider<TafsirRemoteDatasource>((ref) {
  return QuranProxyTafsirRemoteDatasource(
    dio: ref.watch(dioProvider),
    config: ref.watch(quranProxyConfigProvider),
  );
});

final tafsirLocalDatasourceProvider = Provider<TafsirLocalDatasource>((ref) {
  return DriftTafsirLocalDatasource(ref.watch(appDatabaseProvider));
});

final tafsirRepositoryProvider = Provider<TafsirRepository>((ref) {
  return TafsirRepositoryImpl(
    remoteDatasource: ref.watch(tafsirRemoteDatasourceProvider),
    localDatasource: ref.watch(tafsirLocalDatasourceProvider),
  );
});

final tafsirResourcesProvider = FutureProvider<List<TafsirResource>>((ref) {
  return ref.watch(tafsirRepositoryProvider).getResources();
});

final alMuyassarTafsirProvider =
    FutureProvider.family<TafsirEntry, String>((ref, verseKey) {
  return ref.watch(tafsirRepositoryProvider).getAlMuyassarTafsir(
        verseKey: verseKey,
      );
});
