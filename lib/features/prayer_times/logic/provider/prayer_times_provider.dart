import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/database/database_provider.dart';
import '../../../../core/network/dio_provider.dart';
import '../../../../core/sync/sync_providers.dart';
import '../../../auth/logic/entity/auth_session.dart';
import '../../../auth/logic/provider/auth_provider.dart';
import '../../data/datasources/aladhan_remote_datasource.dart';
import '../../data/datasources/prayer_location_datasource.dart';
import '../../data/datasources/prayer_times_local_datasource.dart';
import '../../data/repository/repo_impl/prayer_times_repository_impl.dart';
import '../entity/next_prayer.dart';
import '../entity/prayer_day.dart';
import '../entity/prayer_settings.dart';
import '../next_prayer_calculator.dart';
import '../repository/prayer_times_repository.dart';

final prayerTimesLocalDatasourceProvider = Provider<PrayerTimesLocalDatasource>(
  (ref) {
    return DriftPrayerTimesLocalDatasource(ref.watch(appDatabaseProvider));
  },
);

final prayerTimesRemoteDatasourceProvider =
    Provider<PrayerTimesRemoteDatasource>((ref) {
      return AlAdhanRemoteDatasource(ref.watch(dioProvider));
    });

final prayerLocationDatasourceProvider = Provider<PrayerLocationDatasource>((
  ref,
) {
  return const GeolocatorPrayerLocationDatasource();
});

final prayerTimesRepositoryProvider = Provider<PrayerTimesRepository>((ref) {
  final session =
      ref.watch(authSessionProvider).value ?? const AuthSession.guest();
  return PrayerTimesRepositoryImpl(
    localDatasource: ref.watch(prayerTimesLocalDatasourceProvider),
    remoteDatasource: ref.watch(prayerTimesRemoteDatasourceProvider),
    locationDatasource: ref.watch(prayerLocationDatasourceProvider),
    syncQueueManager: session.isLoggedIn
        ? ref.watch(syncQueueManagerProvider)
        : null,
    session: session,
  );
});

final prayerSettingsProvider = FutureProvider<PrayerSettings>((ref) {
  return ref.watch(prayerTimesRepositoryProvider).getSettings();
});

final todayPrayerTimesProvider = FutureProvider<PrayerDay>((ref) {
  return ref.watch(prayerTimesRepositoryProvider).getPrayerDay();
});

final tomorrowPrayerTimesProvider = FutureProvider<PrayerDay>((ref) {
  return ref
      .watch(prayerTimesRepositoryProvider)
      .getPrayerDay(date: DateTime.now().add(const Duration(days: 1)));
});

final nextPrayerProvider = FutureProvider<NextPrayer?>((ref) async {
  final today = await ref.watch(todayPrayerTimesProvider.future);
  PrayerDay? tomorrow;
  try {
    tomorrow = await ref.watch(tomorrowPrayerTimesProvider.future);
  } on Object {
    tomorrow = null;
  }

  return const NextPrayerCalculator().calculate(
    now: DateTime.now(),
    today: today,
    tomorrow: tomorrow,
  );
});

final prayerSettingsControllerProvider = Provider<PrayerSettingsController>((
  ref,
) {
  return PrayerSettingsController(ref);
});

class PrayerSettingsController {
  const PrayerSettingsController(this._ref);

  final Ref _ref;

  Future<void> save(PrayerSettings settings) async {
    await _ref.read(prayerTimesRepositoryProvider).saveSettings(settings);
    _invalidate();
  }

  Future<void> useCurrentLocation() async {
    await _ref.read(prayerTimesRepositoryProvider).useCurrentLocation();
    _invalidate();
  }

  Future<void> refresh() async {
    await _ref
        .read(prayerTimesRepositoryProvider)
        .getPrayerDay(forceRefresh: true);
    _invalidate();
  }

  void _invalidate() {
    _ref.invalidate(prayerSettingsProvider);
    _ref.invalidate(todayPrayerTimesProvider);
    _ref.invalidate(tomorrowPrayerTimesProvider);
    _ref.invalidate(nextPrayerProvider);
  }
}
