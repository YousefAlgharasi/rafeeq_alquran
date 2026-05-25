import 'reflection_note_source_type.dart';

class ReflectionNote {
  const ReflectionNote({
    required this.id,
    required this.sourceType,
    required this.body,
    required this.syncStatus,
    required this.createdAt,
    required this.updatedAt,
    this.verseKey,
    this.title,
    this.firebaseId,
    this.ownerUserId,
    this.deletedAt,
  });

  final int id;
  final String? verseKey;
  final ReflectionNoteSourceType sourceType;
  final String? title;
  final String body;
  final String? firebaseId;
  final String? ownerUserId;
  final String syncStatus;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
}
