import 'dart:convert';

import '../../../../../core/sync/sync_queue_manager.dart';
import '../../../../auth/logic/entity/auth_session.dart';
import '../../../logic/entity/reflection_note.dart';
import '../../../logic/entity/reflection_note_source_type.dart';
import '../../../logic/repository/reflection_notes_repository.dart';
import '../../datasources/reflection_notes_local_datasource.dart';
import '../../models/reflection_note_model.dart';

class ReflectionNotesRepositoryImpl implements ReflectionNotesRepository {
  const ReflectionNotesRepositoryImpl({
    required ReflectionNotesLocalDatasource localDatasource,
    required SyncQueueManager syncQueueManager,
    required AuthSession session,
  }) : _localDatasource = localDatasource,
       _syncQueueManager = syncQueueManager,
       _session = session;

  final ReflectionNotesLocalDatasource _localDatasource;
  final SyncQueueManager _syncQueueManager;
  final AuthSession _session;

  String? get _ownerUserId => _session.user?.id;

  @override
  Future<List<ReflectionNote>> getNotesForVerse(String verseKey) {
    return _localDatasource.getNotesForVerse(
      ownerUserId: _ownerUserId,
      verseKey: verseKey,
    );
  }

  @override
  Future<ReflectionNote> addNote({
    required String verseKey,
    required ReflectionNoteSourceType sourceType,
    required String body,
    String? title,
  }) async {
    final note = await _localDatasource.saveNote(
      ownerUserId: _ownerUserId,
      verseKey: verseKey,
      sourceType: sourceType,
      body: body,
      title: title,
    );
    await _enqueue(note, 'upsert');
    return note;
  }

  @override
  Future<ReflectionNote?> updateNote({
    required int id,
    required String body,
    String? title,
  }) async {
    final note = await _localDatasource.updateNote(
      ownerUserId: _ownerUserId,
      id: id,
      body: body,
      title: title,
    );
    if (note != null) {
      await _enqueue(note, 'upsert');
    }
    return note;
  }

  @override
  Future<ReflectionNote?> deleteNote(int id) async {
    final note = await _localDatasource.deleteNote(
      ownerUserId: _ownerUserId,
      id: id,
    );
    if (note != null) {
      await _enqueue(note, 'delete');
    }
    return note;
  }

  Future<void> _enqueue(ReflectionNoteModel note, String operation) {
    return _syncQueueManager.enqueueLocalChange(
      session: _session,
      entityType: 'reflection_note',
      localEntityId: note.id,
      operation: operation,
      payloadJson: jsonEncode(note.toSyncJson()),
    );
  }
}
