import 'package:dio/dio.dart';

import '../../../../core/config/islamic_app_quran_config.dart';
import '../../logic/entity/quran_audio_metadata.dart';
import '../../logic/entity/quran_chapter.dart';
import '../../logic/entity/quran_tafsir.dart';
import '../../logic/entity/quran_verse.dart';
import '../../logic/entity/reciter.dart';
import '../models/quran_api_models.dart';
import 'quran_content_datasource.dart';

class IslamicAppQuranRemoteDatasource implements QuranContentRemoteDatasource {
  IslamicAppQuranRemoteDatasource({
    required Dio dio,
    required IslamicAppQuranConfig config,
    required QuranContentRemoteDatasource audioDatasource,
  }) : _dio = dio,
       _config = config,
       _audioDatasource = audioDatasource;

  final Dio _dio;
  final IslamicAppQuranConfig _config;
  final QuranContentRemoteDatasource _audioDatasource;

  static const _verseQueryParameters = <String, Object?>{
    'fields': 'text_uthmani',
    'translations': 'en-sahih-international',
  };

  static const _defaultTafsirResourceId = 'ar-tafsir-ibn-kathir';

  @override
  Future<List<QuranChapter>> getChapters() async {
    final response = await _dio.get<Object?>('${_config.baseUrl}/chapters');
    return readObjectList(response.data, 'chapters')
        .map(
          (json) =>
              QuranApiChapterModel.fromJson(json, source: islamicAppSource),
        )
        .toList();
  }

  @override
  Future<List<QuranVerse>> getVersesByChapter(int chapterNumber) async {
    final response = await _dio.get<Object?>(
      '${_config.baseUrl}/verses/by_chapter/$chapterNumber',
      queryParameters: _verseQueryParameters,
    );
    return readObjectList(response.data, 'verses')
        .map(
          (json) => QuranApiVerseModel.fromJson(json, source: islamicAppSource),
        )
        .where((verse) => verse.textArabic.isNotEmpty)
        .toList();
  }

  @override
  Future<List<QuranVerse>> getVersesByPage(int pageNumber) async {
    final response = await _dio.get<Object?>(
      '${_config.baseUrl}/verses/by_page/$pageNumber',
      queryParameters: _verseQueryParameters,
    );
    return readObjectList(response.data, 'verses')
        .map(
          (json) => QuranApiVerseModel.fromJson(json, source: islamicAppSource),
        )
        .where((verse) => verse.textArabic.isNotEmpty)
        .toList();
  }

  @override
  Future<List<QuranVerse>> getVersesByJuz(int juzNumber) async {
    final response = await _dio.get<Object?>(
      '${_config.baseUrl}/verses/by_juz/$juzNumber',
      queryParameters: _verseQueryParameters,
    );
    return readObjectList(response.data, 'verses')
        .map(
          (json) => QuranApiVerseModel.fromJson(json, source: islamicAppSource),
        )
        .where((verse) => verse.textArabic.isNotEmpty)
        .toList();
  }

  @override
  Future<QuranTafsir> getTafsir({
    required String verseKey,
    required String resourceId,
  }) async {
    final selectedResourceId = resourceId.isEmpty
        ? _defaultTafsirResourceId
        : resourceId;
    final response = await _dio.get<Object?>(
      '${_config.baseUrl}/verses/by_key/$verseKey',
      queryParameters: <String, Object?>{
        'fields': 'text_uthmani',
        'tafsirs': selectedResourceId,
      },
    );
    final data = response.data is Map<String, Object?>
        ? response.data! as Map<String, Object?>
        : <String, Object?>{};
    final nested = data['data'];
    final verse = nested is Map ? nested['verse'] : null;
    final verseJson = verse is Map ? verse.cast<String, Object?>() : data;

    return QuranApiTafsirModel.fromJson(
      verseJson,
      verseKey: verseKey,
      resourceId: selectedResourceId,
    );
  }

  @override
  Future<List<Reciter>> getReciters() {
    return _audioDatasource.getReciters();
  }

  @override
  Future<List<QuranAudioMetadata>> getRecitationMetadata({
    required String reciterId,
    String? verseKey,
  }) {
    return _audioDatasource.getRecitationMetadata(
      reciterId: reciterId,
      verseKey: verseKey,
    );
  }
}
