import 'package:dio/dio.dart';

import '../../../../core/config/islamic_app_quran_config.dart';
import '../../../../core/config/quran_proxy_config.dart';
import '../../logic/entity/tafsir_entry.dart';
import '../../logic/entity/tafsir_level.dart';
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
  }) : _dio = dio,
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

class IslamicAppTafsirRemoteDatasource implements TafsirRemoteDatasource {
  const IslamicAppTafsirRemoteDatasource({
    required Dio dio,
    required IslamicAppQuranConfig config,
  }) : _dio = dio,
       _config = config;

  final Dio _dio;
  final IslamicAppQuranConfig _config;

  static const _reviewedFallbackResources = [
    TafsirResource(
      id: 'ar-tafsir-al-muyassar',
      name: 'Al-Muyassar',
      level: TafsirLevel.alMuyassar,
      isAvailable: true,
      source: 'islamic.app API',
    ),
    TafsirResource(
      id: 'ar-tafsir-ibn-kathir',
      name: 'Tafsir Ibn Kathir',
      level: TafsirLevel.full,
      isAvailable: true,
      source: 'islamic.app API',
    ),
  ];

  @override
  Future<List<TafsirResource>> getResources() async {
    try {
      final response = await _dio.get<Object?>(
        '${_config.baseUrl}/resources/tafsirs',
      );
      final resources = readTafsirResourceList(response.data)
          .map(TafsirApiResourceModel.fromJson)
          .where((resource) => resource.isAvailable)
          .toList();

      if (resources.isNotEmpty) {
        return resources;
      }
    } catch (_) {
      // Fall back to reviewed tafsir slugs documented by islamic.app.
    }

    return _reviewedFallbackResources;
  }

  @override
  Future<TafsirEntry> getTafsir({
    required String verseKey,
    required TafsirResource resource,
  }) async {
    final response = await _dio.get<Object?>(
      '${_config.baseUrl}/verses/by_key/$verseKey',
      queryParameters: <String, Object?>{
        'fields': 'text_uthmani',
        'tafsirs': resource.id,
      },
    );
    final data = response.data is Map<String, Object?>
        ? response.data! as Map<String, Object?>
        : <String, Object?>{};
    final nested = data['data'];
    final verse = nested is Map ? nested['verse'] : null;
    final verseJson = verse is Map ? verse.cast<String, Object?>() : data;

    return TafsirApiEntryModel.fromJson(
      verseJson,
      verseKey: verseKey,
      resource: resource,
    );
  }
}
