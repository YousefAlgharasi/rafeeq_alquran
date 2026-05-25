import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

enum LocalNotificationPermissionStatus {
  granted,
  denied,
  unknown;

  bool get canNotify => this == LocalNotificationPermissionStatus.granted;
}

class LocalNotificationContent {
  const LocalNotificationContent({
    required this.title,
    required this.body,
    this.payload,
  });

  final String title;
  final String body;
  final String? payload;
}

enum LocalNotificationKind { quranReminder, adhan, prePrayer }

abstract class LocalNotificationService {
  Future<void> initialize();

  Future<LocalNotificationPermissionStatus> permissionStatus();

  Future<LocalNotificationPermissionStatus> requestPermission();

  Future<void> openSettings();

  Future<void> cancel(int id);

  Future<void> showNow({
    required int id,
    required LocalNotificationContent content,
    LocalNotificationKind kind = LocalNotificationKind.quranReminder,
    bool enableVibration = true,
  });

  Future<void> schedule({
    required int id,
    required DateTime scheduledAt,
    required LocalNotificationContent content,
    LocalNotificationKind kind = LocalNotificationKind.quranReminder,
    bool enableVibration = true,
  });
}

class FlutterLocalNotificationService implements LocalNotificationService {
  FlutterLocalNotificationService({FlutterLocalNotificationsPlugin? plugin})
    : _plugin = plugin ?? FlutterLocalNotificationsPlugin();

  final FlutterLocalNotificationsPlugin _plugin;
  bool _initialized = false;
  bool _timeZonesInitialized = false;

  @override
  Future<void> initialize() async {
    if (_initialized) {
      return;
    }

    _initializeTimeZone();
    const androidSettings = AndroidInitializationSettings(
      '@mipmap/ic_launcher',
    );
    const initializationSettings = InitializationSettings(
      android: androidSettings,
      iOS: DarwinInitializationSettings(),
    );
    await _plugin.initialize(initializationSettings);
    _initialized = true;
  }

  @override
  Future<LocalNotificationPermissionStatus> permissionStatus() async {
    await initialize();
    final android = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    if (android != null) {
      final enabled = await android.areNotificationsEnabled();
      return switch (enabled) {
        true => LocalNotificationPermissionStatus.granted,
        false => LocalNotificationPermissionStatus.denied,
        null => LocalNotificationPermissionStatus.unknown,
      };
    }

    return LocalNotificationPermissionStatus.unknown;
  }

  @override
  Future<LocalNotificationPermissionStatus> requestPermission() async {
    await initialize();
    final android = _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    if (android != null) {
      final granted = await android.requestNotificationsPermission();
      if (granted == true) {
        return LocalNotificationPermissionStatus.granted;
      }
      final status = await permissionStatus();
      return status == LocalNotificationPermissionStatus.granted
          ? status
          : LocalNotificationPermissionStatus.denied;
    }

    final ios = _plugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >();
    if (ios != null) {
      final granted = await ios.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      return granted == true
          ? LocalNotificationPermissionStatus.granted
          : LocalNotificationPermissionStatus.denied;
    }

    return LocalNotificationPermissionStatus.unknown;
  }

  @override
  Future<void> openSettings() async {
    await openAppSettings();
  }

  @override
  Future<void> cancel(int id) async {
    await initialize();
    await _plugin.cancel(id);
  }

  @override
  Future<void> showNow({
    required int id,
    required LocalNotificationContent content,
    LocalNotificationKind kind = LocalNotificationKind.quranReminder,
    bool enableVibration = true,
  }) async {
    await initialize();
    if (!await _canNotify()) {
      return;
    }
    await _plugin.show(
      id,
      content.title,
      content.body,
      NotificationDetails(
        android: _androidDetails(kind, enableVibration: enableVibration),
        iOS: const DarwinNotificationDetails(),
      ),
      payload: content.payload,
    );
  }

  @override
  Future<void> schedule({
    required int id,
    required DateTime scheduledAt,
    required LocalNotificationContent content,
    LocalNotificationKind kind = LocalNotificationKind.quranReminder,
    bool enableVibration = true,
  }) async {
    await initialize();
    if (!await _canNotify()) {
      return;
    }
    await _plugin.zonedSchedule(
      id,
      content.title,
      content.body,
      tz.TZDateTime.from(scheduledAt, tz.local),
      NotificationDetails(
        android: _androidDetails(kind, enableVibration: enableVibration),
        iOS: const DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      payload: content.payload,
    );
  }

  Future<bool> _canNotify() async {
    return (await permissionStatus()).canNotify;
  }

  void _initializeTimeZone() {
    if (_timeZonesInitialized) {
      return;
    }

    tz_data.initializeTimeZones();
    final locationName = _localLocationName(DateTime.now());
    if (locationName != null) {
      try {
        tz.setLocalLocation(tz.getLocation(locationName));
      } on Object {
        // Keep timezone's default fallback if the platform reports an
        // unexpected identifier.
      }
    }
    _timeZonesInitialized = true;
  }

  String? _localLocationName(DateTime now) {
    final platformName = now.timeZoneName;
    if (tz.timeZoneDatabase.locations.containsKey(platformName)) {
      return platformName;
    }

    final offset = now.timeZoneOffset;
    if (offset.inMinutes == 0) {
      return 'UTC';
    }

    if (offset.inMinutes % 60 != 0) {
      return null;
    }

    final hours = offset.inHours;
    final sign = hours >= 0 ? '-' : '+';
    return 'Etc/GMT$sign${hours.abs()}';
  }

  AndroidNotificationDetails _androidDetails(
    LocalNotificationKind kind, {
    required bool enableVibration,
  }) {
    return switch (kind) {
      LocalNotificationKind.adhan => AndroidNotificationDetails(
        'adhan_notifications_v2',
        'Adhan notifications',
        channelDescription: 'Prayer time adhan notifications',
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        sound: const RawResourceAndroidNotificationSound('adhan_short'),
        enableVibration: enableVibration,
      ),
      LocalNotificationKind.prePrayer => AndroidNotificationDetails(
        'pre_prayer_notifications',
        'Pre-prayer notifications',
        channelDescription: 'Notifications before prayer times',
        importance: Importance.defaultImportance,
        priority: Priority.defaultPriority,
        enableVibration: enableVibration,
      ),
      LocalNotificationKind.quranReminder => AndroidNotificationDetails(
        'quran_reading_reminders',
        'Quran reading reminders',
        channelDescription: 'Daily reminders to keep Quran reading on track',
        importance: Importance.defaultImportance,
        priority: Priority.defaultPriority,
        enableVibration: enableVibration,
      ),
    };
  }
}
