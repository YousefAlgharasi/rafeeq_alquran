import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/core/database/app_database.dart';
import 'package:rafeeq_alquran/features/adhkar/data/datasources/adhkar_local_datasource.dart';
import 'package:rafeeq_alquran/features/adhkar/data/models/adhkar_json_model.dart';

void main() {
  late AppDatabase database;
  late DriftAdhkarLocalDatasource datasource;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    datasource = DriftAdhkarLocalDatasource(database);
  });

  tearDown(() async {
    await database.close();
  });

  test('imports reviewed categories and items into Drift', () async {
    final jsonText = await File(
      'assets/data/adhkar/adhkar_ar_en.json',
    ).readAsString();
    final collection = AdhkarJsonModel.parse(jsonText);

    await datasource.importCollection(collection);

    final categories = await datasource.getCategories();
    expect(categories, hasLength(6));
    expect(categories.map((category) => category.key), contains('morning'));
    final morningItems = await datasource.getItemsForCategory('morning');
    expect(morningItems, isNotEmpty);
    expect(morningItems.first.sourceReference, isNotEmpty);
  });
}
