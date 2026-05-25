import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/core/database/app_database.dart';
import 'package:rafeeq_alquran/features/daily_ayah/data/datasources/daily_ayah_local_datasource.dart';

void main() {
  late AppDatabase database;
  late DriftDailyAyahLocalDatasource datasource;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    datasource = DriftDailyAyahLocalDatasource(database);
  });

  tearDown(() async {
    await database.close();
  });

  test('saves one daily ayah per date and marks it read', () async {
    final date = DateTime(2026, 5, 24, 15);

    await datasource.saveDailyAyah(
      selectedDate: date,
      verseKey: '1:1',
      wasRead: false,
    );
    await datasource.markAsRead(date);

    final entry = await datasource.getEntryForDate(date);

    expect(entry?.verseKey, '1:1');
    expect(entry?.selectedDate, DateTime(2026, 5, 24));
    expect(entry?.wasRead, isTrue);
  });

  test('returns recent ayahs before selected date', () async {
    await datasource.saveDailyAyah(
      selectedDate: DateTime(2026, 5, 22),
      verseKey: '1:1',
      wasRead: false,
    );
    await datasource.saveDailyAyah(
      selectedDate: DateTime(2026, 5, 23),
      verseKey: '1:2',
      wasRead: false,
    );

    final recent = await datasource.getRecentVerseKeys(
      beforeDate: DateTime(2026, 5, 24),
    );

    expect(recent, ['1:2', '1:1']);
  });
}
