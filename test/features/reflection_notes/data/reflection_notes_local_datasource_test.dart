import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/core/database/app_database.dart';
import 'package:rafeeq_alquran/features/reflection_notes/data/datasources/reflection_notes_local_datasource.dart';
import 'package:rafeeq_alquran/features/reflection_notes/logic/entity/reflection_note_source_type.dart';

void main() {
  late AppDatabase database;
  late DriftReflectionNotesLocalDatasource datasource;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
    datasource = DriftReflectionNotesLocalDatasource(database);
  });

  tearDown(() async {
    await database.close();
  });

  test('saves, edits, and soft deletes guest notes locally', () async {
    final note = await datasource.saveNote(
      ownerUserId: null,
      verseKey: '1:1',
      sourceType: ReflectionNoteSourceType.dailyAyah,
      body: 'A personal reflection',
      now: DateTime.utc(2026, 5, 25),
    );

    expect(note.syncStatus, 'local');
    expect(note.ownerUserId, isNull);
    expect(note.sourceType, ReflectionNoteSourceType.dailyAyah);

    final updated = await datasource.updateNote(
      ownerUserId: null,
      id: note.id,
      body: 'Updated reflection',
      now: DateTime.utc(2026, 5, 25, 1),
    );

    expect(updated!.body, 'Updated reflection');
    expect(
      await datasource.getNotesForVerse(ownerUserId: null, verseKey: '1:1'),
      hasLength(1),
    );

    await datasource.deleteNote(
      ownerUserId: null,
      id: note.id,
      now: DateTime.utc(2026, 5, 25, 2),
    );

    expect(
      await datasource.getNotesForVerse(ownerUserId: null, verseKey: '1:1'),
      isEmpty,
    );
  });

  test('logged-in notes are owner scoped and sync-ready', () async {
    await datasource.saveNote(
      ownerUserId: 'user-a',
      verseKey: '2:5',
      sourceType: ReflectionNoteSourceType.quranAyah,
      body: 'User note',
      now: DateTime.utc(2026, 5, 25),
    );

    final userNotes = await datasource.getNotesForVerse(
      ownerUserId: 'user-a',
      verseKey: '2:5',
    );
    final guestNotes = await datasource.getNotesForVerse(
      ownerUserId: null,
      verseKey: '2:5',
    );

    expect(userNotes.single.syncStatus, 'pending');
    expect(userNotes.single.ownerUserId, 'user-a');
    expect(guestNotes, isEmpty);
  });
}
