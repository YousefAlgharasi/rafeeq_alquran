import '../entity/reflection_note.dart';
import '../entity/reflection_note_source_type.dart';

abstract class ReflectionNotesRepository {
  Future<List<ReflectionNote>> getNotesForVerse(String verseKey);

  Future<ReflectionNote> addNote({
    required String verseKey,
    required ReflectionNoteSourceType sourceType,
    required String body,
    String? title,
  });

  Future<ReflectionNote?> updateNote({
    required int id,
    required String body,
    String? title,
  });

  Future<ReflectionNote?> deleteNote(int id);
}
