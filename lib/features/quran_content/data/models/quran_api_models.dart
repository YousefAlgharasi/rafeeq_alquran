import '../../logic/entity/quran_audio_metadata.dart';
import '../../logic/entity/quran_chapter.dart';
import '../../logic/entity/quran_tafsir.dart';
import '../../logic/entity/quran_verse.dart';
import '../../logic/entity/reciter.dart';

const quranFoundationSource = 'Quran.Foundation/Quran.com';
const islamicAppSource = 'islamic.app API';

class QuranApiChapterModel extends QuranChapter {
  const QuranApiChapterModel({
    required super.chapterNumber,
    required super.versesCount,
    required super.source,
    super.nameArabic,
    super.nameEnglish,
  });

  factory QuranApiChapterModel.fromJson(
    Map<String, Object?> json, {
    String source = quranFoundationSource,
  }) {
    return QuranApiChapterModel(
      chapterNumber:
          _int(json['id'] ?? json['chapter_number'] ?? json['number']) ?? 0,
      versesCount: _int(json['verses_count'] ?? json['versesCount']) ?? 0,
      nameArabic: _string(json['name_arabic'] ?? json['nameArabic']),
      nameEnglish: _string(
        json['name_simple'] ?? json['translated_name'] ?? json['nameEnglish'],
      ),
      source: source,
    );
  }
}

class QuranApiVerseModel extends QuranVerse {
  const QuranApiVerseModel({
    required super.verseKey,
    required super.chapterNumber,
    required super.verseNumber,
    required super.textArabic,
    required super.source,
    super.translationText,
    super.translationSource,
  });

  factory QuranApiVerseModel.fromJson(
    Map<String, Object?> json, {
    String source = quranFoundationSource,
  }) {
    final verseKey = _string(json['verse_key'] ?? json['verseKey']) ?? '';
    final keyParts = verseKey.split(':');

    return QuranApiVerseModel(
      verseKey: verseKey,
      chapterNumber:
          _int(json['chapter_number']) ??
          (keyParts.isNotEmpty ? int.tryParse(keyParts.first) : null) ??
          0,
      verseNumber:
          _int(json['verse_number'] ?? json['verseNumber']) ??
          (keyParts.length > 1 ? int.tryParse(keyParts[1]) : null) ??
          0,
      textArabic:
          _string(
            json['text_uthmani'] ??
                json['text_imlaei'] ??
                json['text_arabic'] ??
                json['textArabic'],
          ) ??
          '',
      translationText: _stripHtml(_firstTranslationText(json) ?? ''),
      translationSource: _firstTranslationSource(json),
      source: source,
    );
  }
}

class QuranApiTafsirModel extends QuranTafsir {
  const QuranApiTafsirModel({
    required super.verseKey,
    required super.resourceId,
    required super.languageCode,
    required super.source,
    super.text,
  });

  factory QuranApiTafsirModel.fromJson(
    Map<String, Object?> json, {
    required String verseKey,
    required String resourceId,
  }) {
    final tafsir = json['tafsir'];
    final tafsirJson = tafsir is Map<String, Object?>
        ? tafsir
        : _firstObject(json['tafsirs']) ?? json;

    return QuranApiTafsirModel(
      verseKey: verseKey,
      resourceId: resourceId,
      languageCode: _string(tafsirJson['language_name']) ?? 'ar',
      text: _string(tafsirJson['text']),
      source: _string(tafsirJson['resource_name']) ?? quranFoundationSource,
    );
  }
}

class QuranApiAudioMetadataModel extends QuranAudioMetadata {
  const QuranApiAudioMetadataModel({
    required super.reciterId,
    required super.source,
    super.verseKey,
    super.remoteUrl,
    super.localPath,
    super.isDownloaded,
  });

  factory QuranApiAudioMetadataModel.fromJson(
    Map<String, Object?> json, {
    required String reciterId,
  }) {
    return QuranApiAudioMetadataModel(
      reciterId: reciterId.isNotEmpty
          ? reciterId
          : (_string(json['reciter_id'] ?? json['reciterId']) ?? ''),
      verseKey: _string(json['verse_key'] ?? json['verseKey']),
      remoteUrl: _string(
        json['url'] ??
            json['audio_url'] ??
            json['audioUrl'] ??
            json['audio_file_url'],
      ),
      source: quranFoundationSource,
    );
  }
}

class QuranApiReciterModel extends Reciter {
  const QuranApiReciterModel({
    required super.id,
    required super.source,
    super.nameArabic,
    super.nameEnglish,
    super.style,
  });

  factory QuranApiReciterModel.fromJson(Map<String, Object?> json) {
    return QuranApiReciterModel(
      id: (_int(json['id'] ?? json['reciter_id'] ?? json['reciterId']) ?? 0)
          .toString(),
      nameArabic: _string(json['translated_name'] ?? json['name_arabic']),
      nameEnglish: _string(
        json['reciter_name'] ?? json['name'] ?? json['nameEnglish'],
      ),
      style: _string(json['style']),
      source: quranFoundationSource,
    );
  }
}

List<Map<String, Object?>> readObjectList(
  Object? response,
  String preferredKey,
) {
  final data = response is Map<String, Object?>
      ? response
      : <String, Object?>{};
  final nestedData = data['data'];
  final value =
      data[preferredKey] ??
      (nestedData is Map ? nestedData[preferredKey] : null) ??
      data['data'];
  if (value is List) {
    return value.whereType<Map>().map((item) {
      return item.cast<String, Object?>();
    }).toList();
  }

  return const [];
}

Map<String, Object?>? _firstObject(Object? value) {
  if (value is List && value.isNotEmpty) {
    final first = value.first;
    if (first is Map) {
      return first.cast<String, Object?>();
    }
  }
  return null;
}

String? _firstTranslationText(Map<String, Object?> json) {
  final translations = json['translations'];
  if (translations is List && translations.isNotEmpty) {
    final first = translations.first;
    if (first is Map) {
      return _string(first['text']);
    }
  }

  return _string(json['translationText']);
}

String? _stripHtml(String value) {
  final stripped = value
      .replaceAll(RegExp(r'<sup[^>]*>.*?</sup>', caseSensitive: false), '')
      .replaceAll(RegExp(r'<br\s*/?>', caseSensitive: false), '\n')
      .replaceAll(RegExp(r'<[^>]+>'), '')
      .trim();
  return stripped.isEmpty ? null : stripped;
}

String? _firstTranslationSource(Map<String, Object?> json) {
  final translations = json['translations'];
  if (translations is List && translations.isNotEmpty) {
    final first = translations.first;
    if (first is Map) {
      return _string(first['resource_name'] ?? first['resourceName']);
    }
  }

  return _string(json['translationSource']);
}

int? _int(Object? value) {
  if (value is int) {
    return value;
  }
  if (value is num) {
    return value.toInt();
  }
  if (value is String) {
    return int.tryParse(value);
  }
  return null;
}

String? _string(Object? value) {
  if (value == null) {
    return null;
  }
  if (value is Map && value['name'] != null) {
    return value['name'].toString();
  }
  return value.toString();
}
