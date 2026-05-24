import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/config/quran_proxy_config.dart';
import '../../../../core/database/database_provider.dart';
import '../../../../core/network/dio_provider.dart';
import '../../data/datasources/quran_content_datasource.dart';
import '../../data/datasources/quran_local_datasource.dart';
import '../../data/datasources/quran_proxy_remote_datasource.dart';
import '../../data/repository/repo_impl/quran_content_repository_impl.dart';
import '../entity/quran_chapter.dart';
import '../entity/quran_verse.dart';
import '../entity/reading_position.dart';
import '../repository/quran_content_repository.dart';

final quranProxyConfigProvider = Provider<QuranProxyConfig>((ref) {
  return const QuranProxyConfig(baseUrl: QuranProxyConfig.defaultBaseUrl);
});

final quranLocalDatasourceProvider = Provider<QuranLocalDatasource>((ref) {
  return QuranLocalDatasource(ref.watch(appDatabaseProvider));
});

final quranContentRemoteDatasourceProvider =
    Provider<QuranContentRemoteDatasource>((ref) {
  return QuranProxyRemoteDatasource(
    dio: ref.watch(dioProvider),
    config: ref.watch(quranProxyConfigProvider),
  );
});

final quranContentRepositoryProvider = Provider<QuranContentRepository>((ref) {
  return QuranContentRepositoryImpl(
    remoteDatasource: ref.watch(quranContentRemoteDatasourceProvider),
    localDatasource: ref.watch(quranLocalDatasourceProvider),
  );
});

final quranChaptersProvider = FutureProvider<List<QuranChapter>>((ref) {
  return ref.watch(quranContentRepositoryProvider).getChapters();
});

final quranChapterVersesProvider =
    FutureProvider.family<List<QuranVerse>, int>((ref, chapterNumber) {
  return ref
      .watch(quranContentRepositoryProvider)
      .getVersesByChapter(chapterNumber);
});

final lastReadPositionProvider = FutureProvider<ReadingPosition?>((ref) {
  return ref.watch(quranContentRepositoryProvider).getLastReadPosition();
});
