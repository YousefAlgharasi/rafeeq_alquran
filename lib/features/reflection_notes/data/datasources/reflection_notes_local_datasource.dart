import 'package:drift/drift.dart';

import '../../../../core/database/app_database.dart';
import '../../../../core/sync/sync_status.dart';
import '../../logic/entity/reflection_note_source_type.dart';
import '../models/reflection_note_model.dart';

abstract class ReflectionNotesLocalDatasource {
  Future<List<ReflectionNoteModel>> getNotesForVerse({
    required String? ownerUserId,
    required String verseKey,
  });

  Future<ReflectionNoteModel> saveNote({
    required String? ownerUserId,
    required String verseKey,
    required ReflectionNoteSourceType sourceType,
    required String body,
    String? title,
    DateTime? now,
  });

  Future<ReflectionNoteModel?> updateNote({
    required String? ownerUserId,
    required int id,
    required String body,
    String? title,
    DateTime? now,
  });

  Future<ReflectionNoteModel?> deleteNote({
    required String? ownerUserId,
    required int id,
    DateTime? now,
  });
}

class DriftReflectionNotesLocalDatasource
    implements ReflectionNotesLocalDatasource {
  const DriftReflectionNotesLocalDatasource(this._database);

  final AppDatabase _database;

  @override
  Future<List<ReflectionNoteModel>> getNotesForVerse({
    required String? ownerUserId,
    required String verseKey,
  }) async {
    final rows =
        await (_database.select(_database.reflectionNotes)
              ..where(
                (table) =>
                    table.verseKey.equals(verseKey) &
                    table.deletedAt.isNull() &
                    _ownerExpression(table, ownerUserId),
              )
              ..orderBy([(table) => OrderingTerm.desc(table.updatedAt)]))
            .get();

    return rows.map(ReflectionNoteModel.fromRow).toList();
  }

  @override
  Future<ReflectionNoteModel> saveNote({
    required String? ownerUserId,
    required String verseKey,
    required ReflectionNoteSourceType sourceType,
    required String body,
    String? title,
    DateTime? now,
  }) async {
    final timestamp = now ?? DateTime.now().toUtc();
    final id = await _database
        .into(_database.reflectionNotes)
        .insert(
          ReflectionNotesCompanion.insert(
            verseKey: Value(verseKey),
            sourceType: Value(sourceType.value),
            title: Value(title),
            body: body,
            ownerUserId: Value(ownerUserId),
            syncStatus: Value(
              ownerUserId == null ? 'local' : SyncStatus.pending.value,
            ),
            createdAt: timestamp,
            updatedAt: timestamp,
          ),
        );

    return _getById(id);
  }

  @override
  Future<ReflectionNoteModel?> updateNote({
    required String? ownerUserId,
    required int id,
    required String body,
    String? title,
    DateTime? now,
  }) async {
    final existing = await _findById(id: id, ownerUserId: ownerUserId);
    if (existing == null) {
      return null;
    }

    final timestamp = now ?? DateTime.now().toUtc();
    await (_database.update(
      _database.reflectionNotes,
    )..where((table) => table.id.equals(id))).write(
      ReflectionNotesCompanion(
        title: Value(title),
        body: Value(body),
        updatedAt: Value(timestamp),
        syncStatus: Value(
          ownerUserId == null ? 'local' : SyncStatus.pending.value,
        ),
      ),
    );

    return _getById(id);
  }

  @override
  Future<ReflectionNoteModel?> deleteNote({
    required String? ownerUserId,
    required int id,
    DateTime? now,
  }) async {
    final existing = await _findById(id: id, ownerUserId: ownerUserId);
    if (existing == null) {
      return null;
    }

    final timestamp = now ?? DateTime.now().toUtc();
    await (_database.update(
      _database.reflectionNotes,
    )..where((table) => table.id.equals(id))).write(
      ReflectionNotesCompanion(
        deletedAt: Value(timestamp),
        updatedAt: Value(timestamp),
        syncStatus: Value(
          ownerUserId == null ? 'local' : SyncStatus.pending.value,
        ),
      ),
    );

    return _getById(id);
  }

  Future<ReflectionNoteModel> _getById(int id) async {
    final row = await (_database.select(
      _database.reflectionNotes,
    )..where((table) => table.id.equals(id))).getSingle();
    return ReflectionNoteModel.fromRow(row);
  }

  Future<ReflectionNoteModel?> _findById({
    required int id,
    required String? ownerUserId,
  }) async {
    final row =
        await (_database.select(_database.reflectionNotes)
              ..where(
                (table) =>
                    table.id.equals(id) &
                    table.deletedAt.isNull() &
                    _ownerExpression(table, ownerUserId),
              )
              ..limit(1))
            .getSingleOrNull();

    return row == null ? null : ReflectionNoteModel.fromRow(row);
  }

  Expression<bool> _ownerExpression(
    $ReflectionNotesTable table,
    String? ownerUserId,
  ) {
    return ownerUserId == null
        ? table.ownerUserId.isNull()
        : table.ownerUserId.equals(ownerUserId);
  }
}
