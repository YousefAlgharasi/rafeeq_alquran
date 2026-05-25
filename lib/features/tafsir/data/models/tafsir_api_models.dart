import '../../../quran_content/data/models/quran_api_models.dart';
import '../../logic/entity/tafsir_entry.dart';
import '../../logic/entity/tafsir_level.dart';
import '../../logic/entity/tafsir_resource.dart';

class TafsirApiResourceModel extends TafsirResource {
  const TafsirApiResourceModel({
    required super.id,
    required super.name,
    required super.level,
    required super.isAvailable,
    required super.source,
  });

  factory TafsirApiResourceModel.fromJson(Map<String, Object?> json) {
    final id = _string(json['id'] ?? json['resource_id']) ?? '';
    final name =
        _string(
          json['name'] ??
              json['resource_name'] ??
              json['translated_name'] ??
              json['title'],
        ) ??
        '';

    return TafsirApiResourceModel(
      id: id,
      name: name,
      level: _isAlMuyassarName(name)
          ? TafsirLevel.alMuyassar
          : TafsirLevel.full,
      isAvailable:
          id.isNotEmpty && (_isAlMuyassarName(name) || _isIbnKathirName(name)),
      source: islamicAppSource,
    );
  }
}

class TafsirApiEntryModel extends TafsirEntry {
  const TafsirApiEntryModel({
    required super.verseKey,
    required super.resourceId,
    required super.resourceName,
    required super.level,
    required super.languageCode,
    required super.text,
    required super.source,
  });

  factory TafsirApiEntryModel.fromJson(
    Map<String, Object?> json, {
    required String verseKey,
    required TafsirResource resource,
  }) {
    final tafsir = json['tafsir'];
    final tafsirJson = tafsir is Map<String, Object?>
        ? tafsir
        : _firstObject(json['tafsirs']) ?? json;

    return TafsirApiEntryModel(
      verseKey: verseKey,
      resourceId: resource.id,
      resourceName: resource.name,
      level: resource.level,
      languageCode: _string(tafsirJson['language_name']) ?? 'ar',
      text: _stripHtml(_string(tafsirJson['text']) ?? ''),
      source: _string(tafsirJson['resource_name']) ?? islamicAppSource,
    );
  }
}

List<Map<String, Object?>> readTafsirResourceList(Object? response) {
  final data = response is Map<String, Object?>
      ? response
      : <String, Object?>{};
  final nestedData = data['data'];
  final value =
      data['tafsirs'] ??
      data['resources'] ??
      (nestedData is Map
          ? nestedData['tafsirs'] ?? nestedData['resources']
          : null) ??
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

bool _isAlMuyassarName(String name) {
  final normalized = name.toLowerCase().replaceAll(RegExp(r'[\s\-_]'), '');
  return normalized.contains('muyassar') ||
      normalized.contains('الميسر') ||
      normalized.contains('almuyassar');
}

bool _isIbnKathirName(String name) {
  final normalized = name.toLowerCase().replaceAll(RegExp(r'[\s\-_]'), '');
  return normalized.contains('ibnkathir') || normalized.contains('ابنكثير');
}

String _stripHtml(String value) {
  return value
      .replaceAll(RegExp(r'<br\s*/?>', caseSensitive: false), '\n')
      .replaceAll(RegExp(r'<[^>]+>'), '')
      .trim();
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
