import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/features/tafsir/data/datasources/tafsir_local_datasource.dart';
import 'package:rafeeq_alquran/features/tafsir/data/datasources/tafsir_remote_datasource.dart';
import 'package:rafeeq_alquran/features/tafsir/data/repository/repo_impl/tafsir_repository_impl.dart';
import 'package:rafeeq_alquran/features/tafsir/logic/entity/tafsir_entry.dart';
import 'package:rafeeq_alquran/features/tafsir/logic/entity/tafsir_level.dart';
import 'package:rafeeq_alquran/features/tafsir/logic/entity/tafsir_resource.dart';

void main() {
  test('returns cached Al-Muyassar tafsir before remote fetch', () async {
    final local = _FakeLocalDatasource(
      cached: const TafsirEntry(
        verseKey: '1:1',
        resourceId: 'muyassar',
        resourceName: 'Al-Muyassar',
        level: TafsirLevel.alMuyassar,
        languageCode: 'ar',
        text: 'Cached verified tafsir',
        source: 'cache',
      ),
    );
    final remote = _FakeRemoteDatasource();
    final repository = TafsirRepositoryImpl(
      remoteDatasource: remote,
      localDatasource: local,
    );

    final tafsir = await repository.getAlMuyassarTafsir(verseKey: '1:1');

    expect(tafsir.text, 'Cached verified tafsir');
    expect(remote.fetchCount, 0);
  });

  test('caches remote Al-Muyassar tafsir when cache is empty', () async {
    final local = _FakeLocalDatasource();
    final repository = TafsirRepositoryImpl(
      remoteDatasource: _FakeRemoteDatasource(
        remoteEntry: const TafsirEntry(
          verseKey: '1:1',
          resourceId: 'muyassar',
          resourceName: 'Al-Muyassar',
          level: TafsirLevel.alMuyassar,
          languageCode: 'ar',
          text: 'Remote verified tafsir',
          source: 'remote',
        ),
      ),
      localDatasource: local,
    );

    final tafsir = await repository.getAlMuyassarTafsir(verseKey: '1:1');

    expect(tafsir.text, 'Remote verified tafsir');
    expect(local.cached?.text, 'Remote verified tafsir');
  });

  test('reports unavailable Al-Muyassar resource instead of guessing', () async {
    final repository = TafsirRepositoryImpl(
      remoteDatasource: _FakeRemoteDatasource(resources: const []),
      localDatasource: _FakeLocalDatasource(),
    );

    expect(
      () => repository.getAlMuyassarTafsir(verseKey: '1:1'),
      throwsStateError,
    );
  });
}

class _FakeRemoteDatasource implements TafsirRemoteDatasource {
  _FakeRemoteDatasource({
    this.resources = const [
      TafsirResource(
        id: 'muyassar',
        name: 'Al-Muyassar',
        level: TafsirLevel.alMuyassar,
        isAvailable: true,
        source: 'verified-test-source',
      ),
    ],
    this.remoteEntry,
  });

  final List<TafsirResource> resources;
  final TafsirEntry? remoteEntry;
  int fetchCount = 0;

  @override
  Future<List<TafsirResource>> getResources() async => resources;

  @override
  Future<TafsirEntry> getTafsir({
    required String verseKey,
    required TafsirResource resource,
  }) async {
    fetchCount += 1;
    return remoteEntry ??
        TafsirEntry(
          verseKey: verseKey,
          resourceId: resource.id,
          resourceName: resource.name,
          level: resource.level,
          languageCode: 'ar',
          text: 'Remote verified tafsir',
          source: 'verified-test-source',
        );
  }
}

class _FakeLocalDatasource implements TafsirLocalDatasource {
  _FakeLocalDatasource({this.cached});

  TafsirEntry? cached;

  @override
  Future<void> cacheTafsir(TafsirEntry tafsir) async {
    cached = tafsir;
  }

  @override
  Future<TafsirEntry?> getCachedTafsir({
    required String verseKey,
    required TafsirResource resource,
  }) async {
    return cached;
  }
}
