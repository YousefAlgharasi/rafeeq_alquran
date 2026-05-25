import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database_provider.dart';
import '../../../../core/notifications/local_notification_service.dart';
import '../../../../core/sync/sync_providers.dart';
import '../../../auth/logic/entity/auth_session.dart';
import '../../../auth/logic/provider/auth_provider.dart';
import '../../../prayer_times/logic/entity/prayer_day.dart';
import '../../../prayer_times/logic/entity/prayer_name.dart';
import '../../data/datasources/adhan_notification_local_datasource.dart';
import '../../data/repository/repo_impl/adhan_notification_repository_impl.dart';
import '../entity/adhan_notification_settings.dart';
import '../repository/adhan_notification_repository.dart';

final adhanNotificationLocalDatasourceProvider =
    Provider<AdhanNotificationLocalDatasource>((ref) {
      return DriftAdhanNotificationLocalDatasource(
        ref.watch(appDatabaseProvider),
      );
    });

final adhanNotificationRepositoryProvider =
    Provider<AdhanNotificationRepository>((ref) {
      final session =
          ref.watch(authSessionProvider).value ?? const AuthSession.guest();
      return AdhanNotificationRepositoryImpl(
        localDatasource: ref.watch(adhanNotificationLocalDatasourceProvider),
        notificationService: ref.watch(adhanLocalNotificationServiceProvider),
        syncQueueManager: session.isLoggedIn
            ? ref.watch(syncQueueManagerProvider)
            : null,
        session: session,
      );
    });

final adhanLocalNotificationServiceProvider =
    Provider<LocalNotificationService>((ref) {
      return FlutterLocalNotificationService();
    });

final adhanNotificationSettingsProvider =
    FutureProvider<AdhanNotificationSettings>((ref) {
      return ref.watch(adhanNotificationRepositoryProvider).getSettings();
    });

final adhanNotificationControllerProvider =
    Provider<AdhanNotificationController>((ref) {
      return AdhanNotificationController(ref);
    });

class AdhanNotificationController {
  const AdhanNotificationController(this._ref);

  final Ref _ref;

  Future<void> setAdhanEnabled(PrayerName prayerName, bool isEnabled) async {
    await _ref
        .read(adhanNotificationRepositoryProvider)
        .setAdhanEnabled(prayerName, isEnabled);
    _ref.invalidate(adhanNotificationSettingsProvider);
  }

  Future<void> setPrePrayerEnabled(bool isEnabled) async {
    await _ref
        .read(adhanNotificationRepositoryProvider)
        .setPrePrayerEnabled(isEnabled);
    _ref.invalidate(adhanNotificationSettingsProvider);
  }

  Future<void> setVibrationEnabled(bool isEnabled) async {
    await _ref
        .read(adhanNotificationRepositoryProvider)
        .setVibrationEnabled(isEnabled);
    _ref.invalidate(adhanNotificationSettingsProvider);
  }

  Future<int> refreshSchedules({
    required PrayerDay prayerDay,
    required String Function(PrayerName prayerName) prayerLabelBuilder,
    required String adhanTitle,
    required String Function(String prayerLabel) adhanBodyBuilder,
    required String prePrayerTitle,
    required String Function(String prayerLabel) prePrayerBodyBuilder,
  }) {
    return _ref
        .read(adhanNotificationRepositoryProvider)
        .refreshSchedules(
          prayerDay: prayerDay,
          prayerLabelBuilder: prayerLabelBuilder,
          adhanTitle: adhanTitle,
          adhanBodyBuilder: adhanBodyBuilder,
          prePrayerTitle: prePrayerTitle,
          prePrayerBodyBuilder: prePrayerBodyBuilder,
        );
  }
}
