import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database_provider.dart';
import '../../../../core/sync/sync_providers.dart';
import '../../../auth/logic/entity/auth_session.dart';
import '../../../auth/logic/provider/auth_provider.dart';
import '../../data/datasources/reflection_notes_local_datasource.dart';
import '../../data/repository/repo_impl/reflection_notes_repository_impl.dart';
import '../entity/reflection_note.dart';
import '../entity/reflection_note_source_type.dart';
import '../repository/reflection_notes_repository.dart';

class ReflectionNotesRequest {
  const ReflectionNotesRequest({required this.verseKey});

  final String verseKey;

  @override
  bool operator ==(Object other) {
    return other is ReflectionNotesRequest && other.verseKey == verseKey;
  }

  @override
  int get hashCode => verseKey.hashCode;
}

final reflectionNotesLocalDatasourceProvider =
    Provider<ReflectionNotesLocalDatasource>((ref) {
      return DriftReflectionNotesLocalDatasource(
        ref.watch(appDatabaseProvider),
      );
    });

final reflectionNotesRepositoryProvider = Provider<ReflectionNotesRepository>((
  ref,
) {
  return ReflectionNotesRepositoryImpl(
    localDatasource: ref.watch(reflectionNotesLocalDatasourceProvider),
    syncQueueManager: ref.watch(syncQueueManagerProvider),
    session: ref.watch(authSessionProvider).value ?? const AuthSession.guest(),
  );
});

final reflectionNotesProvider = FutureProvider.autoDispose
    .family<List<ReflectionNote>, ReflectionNotesRequest>((ref, request) {
      return ref
          .watch(reflectionNotesRepositoryProvider)
          .getNotesForVerse(request.verseKey);
    });

final reflectionNotesControllerProvider =
    Provider.autoDispose<ReflectionNotesController>((ref) {
      return ReflectionNotesController(ref);
    });

class ReflectionNotesController {
  const ReflectionNotesController(this._ref);

  final Ref _ref;

  Future<void> addNote({
    required String verseKey,
    required ReflectionNoteSourceType sourceType,
    required String body,
    String? title,
  }) async {
    await _ref
        .read(reflectionNotesRepositoryProvider)
        .addNote(
          verseKey: verseKey,
          sourceType: sourceType,
          body: body,
          title: title,
        );
    _invalidate(verseKey);
  }

  Future<void> updateNote({
    required String verseKey,
    required int id,
    required String body,
    String? title,
  }) async {
    await _ref
        .read(reflectionNotesRepositoryProvider)
        .updateNote(id: id, body: body, title: title);
    _invalidate(verseKey);
  }

  Future<void> deleteNote({required String verseKey, required int id}) async {
    await _ref.read(reflectionNotesRepositoryProvider).deleteNote(id);
    _invalidate(verseKey);
  }

  void _invalidate(String verseKey) {
    _ref.invalidate(
      reflectionNotesProvider(ReflectionNotesRequest(verseKey: verseKey)),
    );
  }
}
