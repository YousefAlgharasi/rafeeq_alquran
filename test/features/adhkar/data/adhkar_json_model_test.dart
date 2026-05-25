import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/features/adhkar/data/models/adhkar_json_model.dart';

void main() {
  test('parses reviewed adhkar asset with required categories', () async {
    final jsonText = await File(
      'assets/data/adhkar/adhkar_ar_en.json',
    ).readAsString();
    final collection = AdhkarJsonModel.parse(jsonText);

    expect(collection.contentStatus, 'reviewed_seed');
    expect(collection.reviewRequired, isFalse);
    expect(collection.categories, hasLength(6));
    expect(
      collection.categories.map((category) => category.key),
      containsAll(AdhkarJsonModel.requiredCategoryKeys),
    );
    final items = collection.categories.expand((category) => category.items);
    expect(items, isNotEmpty);
    expect(items.every((item) => item.sourceReference.isNotEmpty), isTrue);
  });

  test('rejects real adhkar items without source reference', () {
    const jsonText = '''
{
  "schema_version": 1,
  "content_status": "reviewed",
  "review_required": false,
  "review_note": "reviewed by owner",
  "categories": [
    {
      "key": "morning",
      "title_ar": "Morning",
      "title_en": "Morning",
      "source": "trusted-source",
      "items": [
        {
          "key": "morning_001",
          "text_ar": "reviewed text placeholder from test fixture",
          "repeat_count": 1,
          "source": "trusted-source"
        }
      ]
    },
    {"key": "evening", "title_ar": "Evening", "source": "placeholder", "items": []},
    {"key": "sleep", "title_ar": "Sleep", "source": "placeholder", "items": []},
    {"key": "after_prayer", "title_ar": "After", "source": "placeholder", "items": []},
    {"key": "wake_up", "title_ar": "Wake", "source": "placeholder", "items": []},
    {"key": "selected_duas", "title_ar": "Duas", "source": "placeholder", "items": []}
  ]
}
''';

    expect(
      () => AdhkarJsonModel.parse(jsonText),
      throwsA(isA<AdhkarValidationException>()),
    );
  });
}
