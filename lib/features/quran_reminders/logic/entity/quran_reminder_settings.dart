import 'quran_reminder_slot.dart';

class QuranReminderSettings {
  const QuranReminderSettings({required this.isEnabled, required this.slots});

  final bool isEnabled;
  final List<QuranReminderSlot> slots;

  factory QuranReminderSettings.defaults() {
    return const QuranReminderSettings(
      isEnabled: true,
      slots: [
        QuranReminderSlot(
          id: QuranReminderSlotId.afterFajr,
          anchor: QuranReminderAnchor.afterFajr,
          hour: 5,
          minute: 30,
          offsetMinutes: 30,
        ),
        QuranReminderSlot(
          id: QuranReminderSlotId.midday,
          anchor: QuranReminderAnchor.fixedTime,
          hour: 12,
          minute: 30,
        ),
        QuranReminderSlot(
          id: QuranReminderSlotId.afterAsr,
          anchor: QuranReminderAnchor.afterAsr,
          hour: 15,
          minute: 45,
          offsetMinutes: 30,
        ),
        QuranReminderSlot(
          id: QuranReminderSlotId.beforeSleep,
          anchor: QuranReminderAnchor.fixedTime,
          hour: 21,
          minute: 30,
        ),
      ],
    );
  }

  QuranReminderSettings copyWith({
    bool? isEnabled,
    List<QuranReminderSlot>? slots,
  }) {
    return QuranReminderSettings(
      isEnabled: isEnabled ?? this.isEnabled,
      slots: slots ?? this.slots,
    );
  }

  Map<String, Object?> toJson() {
    return {
      'is_enabled': isEnabled,
      'slots': slots.map((slot) => slot.toJson()).toList(),
    };
  }

  static QuranReminderSettings fromJson(Map<String, Object?> json) {
    final rawSlots = json['slots'];
    final slots = rawSlots is List
        ? rawSlots
              .whereType<Map>()
              .map((slot) => QuranReminderSlot.fromJson(slot.cast()))
              .toList()
        : QuranReminderSettings.defaults().slots;

    return QuranReminderSettings(
      isEnabled: json['is_enabled'] as bool? ?? true,
      slots: slots.isEmpty ? QuranReminderSettings.defaults().slots : slots,
    );
  }
}
