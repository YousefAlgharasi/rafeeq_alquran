enum QuranReminderSlotId {
  afterFajr('after_fajr'),
  midday('midday'),
  afterAsr('after_asr'),
  beforeSleep('before_sleep');

  const QuranReminderSlotId(this.storageValue);

  final String storageValue;

  static QuranReminderSlotId fromStorageValue(String value) {
    return QuranReminderSlotId.values.firstWhere(
      (slot) => slot.storageValue == value,
      orElse: () => QuranReminderSlotId.midday,
    );
  }
}

enum QuranReminderAnchor {
  fixedTime('fixed_time'),
  afterFajr('after_fajr'),
  afterAsr('after_asr');

  const QuranReminderAnchor(this.storageValue);

  final String storageValue;

  static QuranReminderAnchor fromStorageValue(String value) {
    return QuranReminderAnchor.values.firstWhere(
      (anchor) => anchor.storageValue == value,
      orElse: () => QuranReminderAnchor.fixedTime,
    );
  }
}

class QuranReminderSlot {
  const QuranReminderSlot({
    required this.id,
    required this.anchor,
    required this.hour,
    required this.minute,
    this.offsetMinutes = 0,
    this.isEnabled = true,
  });

  final QuranReminderSlotId id;
  final QuranReminderAnchor anchor;
  final int hour;
  final int minute;
  final int offsetMinutes;
  final bool isEnabled;

  int get notificationId => 140000 + QuranReminderSlotId.values.indexOf(id);

  DateTime scheduledAtForDate(
    DateTime date, {
    DateTime? fajrTime,
    DateTime? asrTime,
  }) {
    final base = switch (anchor) {
      QuranReminderAnchor.afterFajr => fajrTime ?? _timeOnDate(date),
      QuranReminderAnchor.afterAsr => asrTime ?? _timeOnDate(date),
      QuranReminderAnchor.fixedTime => _timeOnDate(date),
    };

    return base.add(Duration(minutes: offsetMinutes));
  }

  Map<String, Object?> toJson() {
    return {
      'id': id.storageValue,
      'anchor': anchor.storageValue,
      'hour': hour,
      'minute': minute,
      'offset_minutes': offsetMinutes,
      'is_enabled': isEnabled,
    };
  }

  static QuranReminderSlot fromJson(Map<String, Object?> json) {
    return QuranReminderSlot(
      id: QuranReminderSlotId.fromStorageValue(json['id'] as String? ?? ''),
      anchor: QuranReminderAnchor.fromStorageValue(
        json['anchor'] as String? ?? '',
      ),
      hour: json['hour'] as int? ?? 12,
      minute: json['minute'] as int? ?? 0,
      offsetMinutes: json['offset_minutes'] as int? ?? 0,
      isEnabled: json['is_enabled'] as bool? ?? true,
    );
  }

  DateTime _timeOnDate(DateTime date) {
    return DateTime(date.year, date.month, date.day, hour, minute);
  }
}
