import 'package:dio/dio.dart';

import '../../../../core/config/quran_proxy_config.dart';
import '../../logic/entity/tafsir_entry.dart';
import '../../logic/entity/tafsir_resource.dart';
import '../models/tafsir_api_models.dart';

abstract class TafsirRemoteDatasource {
  Future<List<TafsirResource>> getResources();

  Future<TafsirEntry> getTafsir({
    required String verseKey,
    required TafsirResource resource,
  });
}

class QuranProxyTafsirRemoteDatasource implements TafsirRemoteDatasource {
  const QuranProxyTafsirRemoteDatasource({
    required Dio dio,
    required QuranProxyConfig config,
  })  : _dio = dio,
        _config = config;

  final Dio _dio;
  final QuranProxyConfig _config;

  @override
  Future<List<TafsirResource>> getResources() async {
    final response = await _dio.get<Object?>(
      '${_config.baseUrl}/tafsir-resources',
    );
    final resources = readTafsirResourceList(response.data)
        .map(TafsirApiResourceModel.fromJson)
        .where((resource) => resource.isAvailable)
        .toList();

    return resources;
  }

  @override
  Future<TafsirEntry> getTafsir({
    required String verseKey,
    required TafsirResource resource,
  }) async {
    final response = await _dio.get<Object?>(
      '${_config.baseUrl}/tafsir/${resource.id}/$verseKey',
    );
    final data = response.data is Map<String, Object?>
        ? response.data! as Map<String, Object?>
        : <String, Object?>{};

    return TafsirApiEntryModel.fromJson(
      data,
      verseKey: verseKey,
      resource: resource,
    );
  }
}
