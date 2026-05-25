import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';

class DailyAyahHistoryEntry {
  const DailyAyahHistoryEntry({
    required this.verseKey,
    required this.selectedDate,
    required this.wasRead,
  });

  final String verseKey;
  final DateTime selectedDate;
  final bool wasRead;
}

abstract class DailyAyahLocalDatasource {
  Future<DailyAyahHistoryEntry?> getEntryForDate(DateTime date);

  Future<List<String>> getRecentVerseKeys({
    required DateTime beforeDate,
    int limit = 7,
  });

  Future<void> saveDailyAyah({
    required DateTime selectedDate,
    required String verseKey,
    required bool wasRead,
  });

  Future<void> markAsRead(DateTime selectedDate);
}

class DriftDailyAyahLocalDatasource implements DailyAyahLocalDatasource {
  const DriftDailyAyahLocalDatasource(this._database);

  final AppDatabase _database;

  @override
  Future<DailyAyahHistoryEntry?> getEntryForDate(DateTime date) async {
    final day = _dateOnly(date);
    final row = await (_database.select(_database.dailyAyahHistory)
          ..where((table) => table.selectedDate.equals(day))
          ..orderBy([(table) => OrderingTerm.desc(table.updatedAt)])
          ..limit(1))
        .getSingleOrNull();

    return row == null ? null : _fromRow(row);
  }

  @override
  Future<List<String>> getRecentVerseKeys({
    required DateTime beforeDate,
    int limit = 7,
  }) async {
    final rows = await (_database.select(_database.dailyAyahHistory)
          ..where((table) => table.selectedDate.isSmallerThanValue(
                _dateOnly(beforeDate),
              ))
          ..orderBy([(table) => OrderingTerm.desc(table.selectedDate)])
          ..limit(limit))
        .get();

    return rows.map((row) => row.verseKey).toList();
  }

  @override
  Future<void> saveDailyAyah({
    required DateTime selectedDate,
    required String verseKey,
    required bool wasRead,
  }) async {
    final day = _dateOnly(selectedDate);
    final existing = await getEntryForDate(day);
    final now = DateTime.now().toUtc();

    if (existing != null) {
      await (_database.update(_database.dailyAyahHistory)
            ..where((table) => table.selectedDate.equals(day)))
          .write(
        DailyAyahHistoryCompanion(
          verseKey: Value(verseKey),
          wasRead: Value(wasRead || existing.wasRead),
          updatedAt: Value(now),
        ),
      );
      return;
    }

    await _database.into(_database.dailyAyahHistory).insert(
          DailyAyahHistoryCompanion.insert(
            verseKey: verseKey,
            selectedDate: day,
            wasRead: Value(wasRead),
            createdAt: now,
            updatedAt: now,
          ),
        );
  }

  @override
  Future<void> markAsRead(DateTime selectedDate) async {
    final day = _dateOnly(selectedDate);
    await (_database.update(_database.dailyAyahHistory)
          ..where((table) => table.selectedDate.equals(day)))
        .write(
      DailyAyahHistoryCompanion(
        wasRead: const Value(true),
        updatedAt: Value(DateTime.now().toUtc()),
      ),
    );
  }

  DailyAyahHistoryEntry _fromRow(DailyAyahHistoryData row) {
    return DailyAyahHistoryEntry(
      verseKey: row.verseKey,
      selectedDate: row.selectedDate,
      wasRead: row.wasRead,
    );
  }

  DateTime _dateOnly(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }
}
