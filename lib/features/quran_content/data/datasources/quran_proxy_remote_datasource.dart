import 'package:dio/dio.dart';

import '../../../../core/config/quran_proxy_config.dart';
import '../../logic/entity/quran_audio_metadata.dart';
import '../../logic/entity/quran_chapter.dart';
import '../../logic/entity/quran_tafsir.dart';
import '../../logic/entity/quran_verse.dart';
import '../../logic/entity/reciter.dart';
import '../models/quran_api_models.dart';
import 'quran_content_datasource.dart';

class QuranProxyRemoteDatasource implements QuranContentRemoteDatasource {
  QuranProxyRemoteDatasource({
    required Dio dio,
    required QuranProxyConfig config,
  })  : _dio = dio,
        _config = config;

  final Dio _dio;
  final QuranProxyConfig _config;

  static const _verseQueryParameters = <String, Object?>{
    'fields': 'text_uthmani,chapter_number,verse_number,verse_key',
    'per_page': 300,
  };

  @override
  Future<List<QuranChapter>> getChapters() async {
    final response = await _dio.get<Object?>('${_config.baseUrl}/chapters');
    return readObjectList(response.data, 'chapters')
        .map(QuranApiChapterModel.fromJson)
        .toList();
  }

  @override
  Future<List<QuranVerse>> getVersesByChapter(int chapterNumber) async {
    final response = await _dio.get<Object?>(
      '${_config.baseUrl}/verses/chapter/$chapterNumber',
      queryParameters: _verseQueryParameters,
    );
    return readObjectList(response.data, 'verses')
        .map(QuranApiVerseModel.fromJson)
        .where((verse) => verse.textArabic.isNotEmpty)
        .toList();
  }

  @override
  Future<List<QuranVerse>> getVersesByPage(int pageNumber) async {
    final response = await _dio.get<Object?>(
      '${_config.baseUrl}/verses/page/$pageNumber',
      queryParameters: _verseQueryParameters,
    );
    return readObjectList(response.data, 'verses')
        .map(QuranApiVerseModel.fromJson)
        .where((verse) => verse.textArabic.isNotEmpty)
        .toList();
  }

  @override
  Future<List<QuranVerse>> getVersesByJuz(int juzNumber) async {
    final response = await _dio.get<Object?>(
      '${_config.baseUrl}/verses/juz/$juzNumber',
      queryParameters: _verseQueryParameters,
    );
    return readObjectList(response.data, 'verses')
        .map(QuranApiVerseModel.fromJson)
        .where((verse) => verse.textArabic.isNotEmpty)
        .toList();
  }

  @override
  Future<QuranTafsir> getTafsir({
    required String verseKey,
    required String resourceId,
  }) async {
    final response = await _dio.get<Object?>(
      '${_config.baseUrl}/tafsir/$resourceId/$verseKey',
    );
    final data = response.data is Map<String, Object?>
        ? response.data! as Map<String, Object?>
        : <String, Object?>{};
    return QuranApiTafsirModel.fromJson(
      data,
      verseKey: verseKey,
      resourceId: resourceId,
    );
  }

  @override
  Future<List<Reciter>> getReciters() async {
    final response = await _dio.get<Object?>('${_config.baseUrl}/audio/reciters');
    return readObjectList(response.data, 'recitations')
        .map(QuranApiReciterModel.fromJson)
        .where((reciter) => reciter.id != '0')
        .toList();
  }

  @override
  Future<List<QuranAudioMetadata>> getRecitationMetadata({
    required String reciterId,
    String? verseKey,
  }) async {
    final queryParameters = <String, Object?>{};
    if (verseKey != null) {
      queryParameters['verse_key'] = verseKey;
    }

    final response = await _dio.get<Object?>(
      '${_config.baseUrl}/audio/recitations/$reciterId',
      queryParameters: queryParameters,
    );
    return readObjectList(response.data, 'audio_files')
        .map((json) => QuranApiAudioMetadataModel.fromJson(
              json,
              reciterId: reciterId,
            ))
        .toList();
  }
}
