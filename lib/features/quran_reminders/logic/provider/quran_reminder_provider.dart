import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database_provider.dart';
import '../../../../core/notifications/local_notification_service.dart';
import '../../../../core/sync/sync_providers.dart';
import '../../../auth/logic/entity/auth_session.dart';
import '../../../auth/logic/provider/auth_provider.dart';
import '../../data/datasources/quran_reminder_local_datasource.dart';
import '../../data/repository/repo_impl/quran_reminder_repository_impl.dart';
import '../entity/quran_reminder_settings.dart';
import '../repository/quran_reminder_repository.dart';

final localNotificationServiceProvider = Provider<LocalNotificationService>((
  ref,
) {
  return FlutterLocalNotificationService();
});

final quranReminderLocalDatasourceProvider =
    Provider<QuranReminderLocalDatasource>((ref) {
      return DriftQuranReminderLocalDatasource(ref.watch(appDatabaseProvider));
    });

final quranReminderRepositoryProvider = Provider<QuranReminderRepository>((
  ref,
) {
  final session = ref
      .watch(authSessionProvider)
      .when(
        data: (session) => session,
        error: (error, stackTrace) => const AuthSession.guest(),
        loading: () => const AuthSession.guest(),
      );

  return QuranReminderRepositoryImpl(
    localDatasource: ref.watch(quranReminderLocalDatasourceProvider),
    notificationService: ref.watch(localNotificationServiceProvider),
    syncQueueManager: ref.watch(syncQueueManagerProvider),
    session: session,
  );
});

final quranReminderSettingsProvider = FutureProvider<QuranReminderSettings>((
  ref,
) {
  return ref.watch(quranReminderRepositoryProvider).getSettings();
});
