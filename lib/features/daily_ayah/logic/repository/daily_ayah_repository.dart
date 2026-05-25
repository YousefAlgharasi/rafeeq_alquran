import '../entity/daily_ayah.dart';

abstract class DailyAyahRepository {
  Future<DailyAyah> getDailyAyah({
    DateTime? date,
    bool forceRefresh = false,
  });

  Future<void> markAsRead({DateTime? date});
}
