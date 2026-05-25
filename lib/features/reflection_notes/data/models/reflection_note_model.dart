import '../../../../core/database/app_database.dart' as db;
import '../../logic/entity/reflection_note.dart';
import '../../logic/entity/reflection_note_source_type.dart';

class ReflectionNoteModel extends ReflectionNote {
  const ReflectionNoteModel({
    required super.id,
    required super.sourceType,
    required super.body,
    required super.syncStatus,
    required super.createdAt,
    required super.updatedAt,
    super.verseKey,
    super.title,
    super.firebaseId,
    super.ownerUserId,
    super.deletedAt,
  });

  factory ReflectionNoteModel.fromRow(db.ReflectionNote row) {
    return ReflectionNoteModel(
      id: row.id,
      verseKey: row.verseKey,
      sourceType: ReflectionNoteSourceType.fromValue(row.sourceType),
      title: row.title,
      body: row.body,
      firebaseId: row.firebaseId,
      ownerUserId: row.ownerUserId,
      syncStatus: row.syncStatus,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
      deletedAt: row.deletedAt,
    );
  }

  Map<String, Object?> toSyncJson() {
    return {
      'id': id,
      'verseKey': verseKey,
      'sourceType': sourceType.value,
      'title': title,
      'body': body,
      'firebaseId': firebaseId,
      'ownerUserId': ownerUserId,
      'syncStatus': syncStatus,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'deletedAt': deletedAt?.toIso8601String(),
    };
  }
}
