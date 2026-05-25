import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/core/database/app_database.dart';
import 'package:rafeeq_alquran/core/sync/sync_queue_manager.dart';
import 'package:rafeeq_alquran/features/auth/logic/entity/auth_session.dart';
import 'package:rafeeq_alquran/features/auth/logic/entity/auth_user.dart';
import 'package:rafeeq_alquran/features/reflection_notes/data/datasources/reflection_notes_local_datasource.dart';
import 'package:rafeeq_alquran/features/reflection_notes/data/repository/repo_impl/reflection_notes_repository_impl.dart';
import 'package:rafeeq_alquran/features/reflection_notes/logic/entity/reflection_note_source_type.dart';

void main() {
  late AppDatabase database;

  setUp(() {
    database = AppDatabase.forTesting(NativeDatabase.memory());
  });

  tearDown(() async {
    await database.close();
  });

  test('guest notes save locally without queueing sync', () async {
    final repository = ReflectionNotesRepositoryImpl(
      localDatasource: DriftReflectionNotesLocalDatasource(database),
      syncQueueManager: SyncQueueManager(database),
      session: const AuthSession.guest(),
    );

    await repository.addNote(
      verseKey: '1:1',
      sourceType: ReflectionNoteSourceType.quranAyah,
      body: 'Guest reflection',
    );

    expect(await database.select(database.reflectionNotes).get(), hasLength(1));
    expect(await database.select(database.syncQueue).get(), isEmpty);
  });

  test('logged-in notes save locally then enqueue sync work', () async {
    const session = AuthSession.loggedIn(AuthUser(id: 'user-1'));
    final repository = ReflectionNotesRepositoryImpl(
      localDatasource: DriftReflectionNotesLocalDatasource(database),
      syncQueueManager: SyncQueueManager(database),
      session: session,
    );

    final note = await repository.addNote(
      verseKey: '2:5',
      sourceType: ReflectionNoteSourceType.dailyAyah,
      body: 'Account reflection',
    );

    final rows = await database.select(database.syncQueue).get();

    expect(note.syncStatus, 'pending');
    expect(rows.single.entityType, 'reflection_note');
    expect(rows.single.operation, 'upsert');
    expect(rows.single.ownerUserId, 'user-1');
  });
}
