import 'dart:convert';

import '../../logic/entity/adhkar_category_entity.dart';
import '../../logic/entity/adhkar_collection.dart';
import '../../logic/entity/adhkar_item_entity.dart';

class AdhkarValidationException implements Exception {
  const AdhkarValidationException(this.message);

  final String message;

  @override
  String toString() => message;
}

class AdhkarJsonModel {
  const AdhkarJsonModel._();

  static const requiredCategoryKeys = {
    'morning',
    'evening',
    'sleep',
    'after_prayer',
    'wake_up',
    'selected_duas',
  };

  static AdhkarCollection parse(String jsonText) {
    final decoded = jsonDecode(jsonText);
    if (decoded is! Map<String, Object?>) {
      throw const AdhkarValidationException('Adhkar JSON root must be an object.');
    }

    final categoriesJson = decoded['categories'];
    if (categoriesJson is! List) {
      throw const AdhkarValidationException('Adhkar JSON must include categories.');
    }

    final categories = categoriesJson
        .whereType<Map>()
        .map((category) => _parseCategory(category.cast<String, Object?>()))
        .toList();
    _validateCategories(categories);

    return AdhkarCollection(
      schemaVersion: decoded['schema_version'] as int? ?? 1,
      contentStatus: decoded['content_status'] as String? ?? 'unknown',
      reviewRequired: decoded['review_required'] as bool? ?? true,
      reviewNote: decoded['review_note'] as String? ?? '',
      categories: categories,
    );
  }

  static AdhkarCategoryEntity _parseCategory(Map<String, Object?> json) {
    final key = _requiredString(json, 'key');
    final source = _requiredString(json, 'source');
    final itemsJson = json['items'];
    if (itemsJson is! List) {
      throw AdhkarValidationException('Category $key must include items.');
    }

    return AdhkarCategoryEntity(
      key: key,
      titleArabic: _requiredString(json, 'title_ar'),
      titleEnglish: json['title_en'] as String?,
      source: source,
      items: itemsJson
          .whereType<Map>()
          .map((item) => _parseItem(key, item.cast<String, Object?>()))
          .toList(),
    );
  }

  static AdhkarItemEntity _parseItem(
    String categoryKey,
    Map<String, Object?> json,
  ) {
    final repeatCount = json['repeat_count'];
    if (repeatCount is! int || repeatCount < 1) {
      throw AdhkarValidationException(
        'Adhkar item in $categoryKey must include repeat_count greater than 0.',
      );
    }

    return AdhkarItemEntity(
      key: _requiredString(json, 'key'),
      categoryKey: categoryKey,
      textArabic: _requiredString(json, 'text_ar'),
      textEnglish: json['text_en'] as String?,
      repeatCount: repeatCount,
      source: _requiredString(json, 'source'),
      sourceReference: _requiredString(json, 'source_reference'),
    );
  }

  static void _validateCategories(List<AdhkarCategoryEntity> categories) {
    final keys = categories.map((category) => category.key).toSet();
    final missing = requiredCategoryKeys.difference(keys);
    if (missing.isNotEmpty) {
      throw AdhkarValidationException(
        'Missing required adhkar categories: ${missing.join(', ')}.',
      );
    }
  }

  static String _requiredString(Map<String, Object?> json, String key) {
    final value = json[key];
    if (value is! String || value.trim().isEmpty) {
      throw AdhkarValidationException('Missing required string field: $key.');
    }
    return value;
  }
}
