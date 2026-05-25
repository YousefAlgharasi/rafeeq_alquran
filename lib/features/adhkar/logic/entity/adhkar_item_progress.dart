import 'adhkar_item_entity.dart';
import 'adhkar_progress_entity.dart';

class AdhkarItemProgress {
  const AdhkarItemProgress({
    required this.item,
    required this.currentCount,
    required this.isCompleted,
    this.progress,
  });

  final AdhkarItemEntity item;
  final AdhkarProgressEntity? progress;
  final int currentCount;
  final bool isCompleted;

  int get requiredCount => item.repeatCount;

  String get counterText => '$currentCount / $requiredCount';
}
