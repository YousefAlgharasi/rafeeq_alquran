import '../../../logic/entity/tafsir_entry.dart';
import '../../../logic/entity/tafsir_level.dart';
import '../../../logic/entity/tafsir_resource.dart';
import '../../../logic/repository/tafsir_repository.dart';
import '../../datasources/tafsir_local_datasource.dart';
import '../../datasources/tafsir_remote_datasource.dart';

class TafsirRepositoryImpl implements TafsirRepository {
  const TafsirRepositoryImpl({
    required TafsirRemoteDatasource remoteDatasource,
    required TafsirLocalDatasource localDatasource,
  })  : _remoteDatasource = remoteDatasource,
        _localDatasource = localDatasource;

  final TafsirRemoteDatasource _remoteDatasource;
  final TafsirLocalDatasource _localDatasource;

  @override
  Future<List<TafsirResource>> getResources() async {
    final remote = await _remoteDatasource.getResources();
    final alMuyassar = remote
        .where((resource) => resource.level == TafsirLevel.alMuyassar)
        .toList();

    return [
      ...unavailableTafsirResources.where(
        (resource) => resource.level == TafsirLevel.shortMeaning,
      ),
      ...alMuyassar,
      ...unavailableTafsirResources.where(
        (resource) => resource.level == TafsirLevel.full,
      ),
    ];
  }

  @override
  Future<TafsirEntry> getAlMuyassarTafsir({
    required String verseKey,
    bool forceRefresh = false,
  }) async {
    final resource = await _getAlMuyassarResource();
    final cached = await _localDatasource.getCachedTafsir(
      verseKey: verseKey,
      resource: resource,
    );
    if (cached != null && !forceRefresh) {
      return cached;
    }

    try {
      final remote = await _remoteDatasource.getTafsir(
        verseKey: verseKey,
        resource: resource,
      );
      if (remote.text.isNotEmpty) {
        await _localDatasource.cacheTafsir(remote);
        return remote;
      }
    } catch (_) {
      if (cached != null) {
        return cached;
      }
      rethrow;
    }

    if (cached != null) {
      return cached;
    }
    throw StateError('Tafsir Al-Muyassar is unavailable for $verseKey.');
  }

  Future<TafsirResource> _getAlMuyassarResource() async {
    final resources = await _remoteDatasource.getResources();
    final matches = resources.where(
      (resource) =>
          resource.level == TafsirLevel.alMuyassar && resource.isAvailable,
    );
    if (matches.isEmpty) {
      throw StateError(
        'Tafsir Al-Muyassar resource is unavailable from the approved source.',
      );
    }
    return matches.first;
  }
}
