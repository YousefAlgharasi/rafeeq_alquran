import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/features/prayer_times/data/datasources/aladhan_remote_datasource.dart';
import 'package:rafeeq_alquran/features/prayer_times/data/datasources/prayer_location_datasource.dart';
import 'package:rafeeq_alquran/features/prayer_times/data/datasources/prayer_times_local_datasource.dart';
import 'package:rafeeq_alquran/features/prayer_times/data/repository/repo_impl/prayer_times_repository_impl.dart';
import 'package:rafeeq_alquran/features/prayer_times/logic/entity/prayer_day.dart';
import 'package:rafeeq_alquran/features/prayer_times/logic/entity/prayer_name.dart';
import 'package:rafeeq_alquran/features/prayer_times/logic/entity/prayer_settings.dart';
import 'package:rafeeq_alquran/features/prayer_times/logic/entity/prayer_time.dart';

void main() {
  test('returns cached prayer day when refresh fails offline', () async {
    final cached = _day(DateTime(2026, 5, 25), source: 'cache');
    final repository = PrayerTimesRepositoryImpl(
      localDatasource: _FakeLocalDatasource(cachedDay: cached),
      remoteDatasource: const _FakeRemoteDatasource(throwOnFetch: true),
      locationDatasource: _FakeLocationDatasource(),
    );

    final day = await repository.getPrayerDay(
      date: DateTime(2026, 5, 25),
      forceRefresh: true,
    );

    expect(day.source, 'cache');
    expect(day.prayers.first.name, PrayerName.fajr);
  });

  test('caches remote prayer month when cache is empty', () async {
    final local = _FakeLocalDatasource();
    final repository = PrayerTimesRepositoryImpl(
      localDatasource: local,
      remoteDatasource: _FakeRemoteDatasource(
        days: [_day(DateTime(2026, 5, 25), source: 'remote')],
      ),
      locationDatasource: _FakeLocationDatasource(),
    );

    final day = await repository.getPrayerDay(date: DateTime(2026, 5, 25));

    expect(day.source, 'remote');
    expect(local.cachedMonth.single.source, 'remote');
  });
}

PrayerDay _day(DateTime date, {required String source}) {
  return PrayerDay(
    date: date,
    locationLabel: 'Sanaa, Yemen',
    source: source,
    prayers: [
      PrayerTime(name: PrayerName.fajr, time: DateTime(2026, 5, 25, 4, 30)),
    ],
  );
}

class _FakeLocalDatasource implements PrayerTimesLocalDatasource {
  _FakeLocalDatasource({this.cachedDay});

  PrayerDay? cachedDay;
  List<PrayerDay> cachedMonth = const [];
  PrayerSettings settings = PrayerSettings.defaults().copyWith(
    locationMode: PrayerLocationMode.manual,
    city: 'Sanaa',
    country: 'Yemen',
  );

  @override
  Future<void> cacheMonth({
    required List<PrayerDay> days,
    required PrayerSettings settings,
  }) async {
    cachedMonth = days;
    cachedDay = days.first;
  }

  @override
  Future<PrayerDay?> getCachedDay({
    required DateTime date,
    required PrayerSettings settings,
  }) async {
    return cachedDay;
  }

  @override
  Future<PrayerSettings> getSettings() async => settings;

  @override
  Future<void> saveSettings(PrayerSettings settings) async {
    this.settings = settings;
  }
}

class _FakeRemoteDatasource implements PrayerTimesRemoteDatasource {
  const _FakeRemoteDatasource({
    this.days = const [],
    this.throwOnFetch = false,
  });

  final List<PrayerDay> days;
  final bool throwOnFetch;

  @override
  Future<List<PrayerDay>> fetchMonthByCity({
    required int year,
    required int month,
    required PrayerSettings settings,
  }) async {
    if (throwOnFetch) {
      throw StateError('offline');
    }
    return days;
  }

  @override
  Future<List<PrayerDay>> fetchMonthByCoordinates({
    required int year,
    required int month,
    required PrayerSettings settings,
  }) async {
    if (throwOnFetch) {
      throw StateError('offline');
    }
    return days;
  }
}

class _FakeLocationDatasource implements PrayerLocationDatasource {
  @override
  Future<PrayerLocation> getCurrentLocation() async {
    return const PrayerLocation(latitude: 15.3694, longitude: 44.191);
  }
}
