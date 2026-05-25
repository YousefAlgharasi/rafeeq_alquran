import 'package:geolocator/geolocator.dart';

class PrayerLocation {
  const PrayerLocation({required this.latitude, required this.longitude});

  final double latitude;
  final double longitude;
}

abstract class PrayerLocationDatasource {
  Future<PrayerLocation> getCurrentLocation();
}

class GeolocatorPrayerLocationDatasource implements PrayerLocationDatasource {
  const GeolocatorPrayerLocationDatasource();

  @override
  Future<PrayerLocation> getCurrentLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw const PrayerLocationException('Location services are disabled.');
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      throw const PrayerLocationException('Location permission is denied.');
    }

    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.low,
        timeLimit: Duration(seconds: 10),
      ),
    );

    return PrayerLocation(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }
}

class PrayerLocationException implements Exception {
  const PrayerLocationException(this.message);

  final String message;

  @override
  String toString() => message;
}
