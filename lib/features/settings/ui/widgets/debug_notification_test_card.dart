import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/notifications/local_notification_service.dart';

class DebugNotificationTestCard extends StatefulWidget {
  const DebugNotificationTestCard({
    required this.notificationService,
    super.key,
  });

  final LocalNotificationService notificationService;

  @override
  State<DebugNotificationTestCard> createState() =>
      _DebugNotificationTestCardState();
}

class _DebugNotificationTestCardState extends State<DebugNotificationTestCard> {
  static const _baseId = 900000;
  bool _isBusy = false;

  @override
  Widget build(BuildContext context) {
    if (!kDebugMode) {
      return const SizedBox.shrink();
    }

    final localizations = AppLocalizations.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              localizations.debugNotifications,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                FilledButton.icon(
                  onPressed: _isBusy
                      ? null
                      : () => _show(
                          id: _baseId + 1,
                          kind: LocalNotificationKind.adhan,
                          title: localizations.adhanNotifications,
                          body: localizations.adhanNotificationBody('Fajr'),
                        ),
                  icon: const Icon(Icons.volume_up_outlined),
                  label: Text(localizations.testAdhanNow),
                ),
                OutlinedButton.icon(
                  onPressed: _isBusy
                      ? null
                      : () => _schedule(
                          id: _baseId + 2,
                          kind: LocalNotificationKind.adhan,
                          title: localizations.adhanNotifications,
                          body: localizations.adhanNotificationBody('Fajr'),
                        ),
                  icon: const Icon(Icons.timer_outlined),
                  label: Text(localizations.testAdhanAfterFiveSeconds),
                ),
                FilledButton.icon(
                  onPressed: _isBusy
                      ? null
                      : () => _show(
                          id: _baseId + 3,
                          kind: LocalNotificationKind.prePrayer,
                          title: localizations.prePrayerNotifications,
                          body: localizations.prePrayerNotificationBody(
                            'Dhuhr',
                          ),
                        ),
                  icon: const Icon(Icons.notifications_outlined),
                  label: Text(localizations.testPrePrayerNow),
                ),
                OutlinedButton.icon(
                  onPressed: _isBusy
                      ? null
                      : () => _schedule(
                          id: _baseId + 4,
                          kind: LocalNotificationKind.prePrayer,
                          title: localizations.prePrayerNotifications,
                          body: localizations.prePrayerNotificationBody(
                            'Dhuhr',
                          ),
                        ),
                  icon: const Icon(Icons.timer_outlined),
                  label: Text(localizations.testPrePrayerAfterFiveSeconds),
                ),
                FilledButton.icon(
                  onPressed: _isBusy
                      ? null
                      : () => _show(
                          id: _baseId + 5,
                          kind: LocalNotificationKind.quranReminder,
                          title: localizations.appName,
                          body: localizations.quranReminderNotificationBody,
                        ),
                  icon: const Icon(Icons.menu_book_outlined),
                  label: Text(localizations.testQuranReminder),
                ),
                OutlinedButton.icon(
                  onPressed: _isBusy
                      ? null
                      : () => _show(
                          id: _baseId + 6,
                          kind: LocalNotificationKind.prePrayer,
                          title: localizations.vibration,
                          body: localizations.testVibrationBody,
                          enableVibration: true,
                        ),
                  icon: const Icon(Icons.vibration_outlined),
                  label: Text(localizations.testVibration),
                ),
                OutlinedButton.icon(
                  onPressed: _isBusy
                      ? null
                      : () => _show(
                          id: _baseId + 7,
                          kind: LocalNotificationKind.prePrayer,
                          title: localizations.testDefaultSound,
                          body: localizations.testDefaultSoundBody,
                        ),
                  icon: const Icon(Icons.notifications_active_outlined),
                  label: Text(localizations.testDefaultSound),
                ),
                OutlinedButton.icon(
                  onPressed: _isBusy
                      ? null
                      : () => _show(
                          id: _baseId + 8,
                          kind: LocalNotificationKind.adhan,
                          title: localizations.testAdhanSound,
                          body: localizations.testAdhanSoundBody,
                        ),
                  icon: const Icon(Icons.volume_up),
                  label: Text(localizations.testAdhanSound),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _show({
    required int id,
    required LocalNotificationKind kind,
    required String title,
    required String body,
    bool enableVibration = true,
  }) async {
    await _run(
      () => widget.notificationService.showNow(
        id: id,
        kind: kind,
        enableVibration: enableVibration,
        content: LocalNotificationContent(title: title, body: body),
      ),
    );
  }

  Future<void> _schedule({
    required int id,
    required LocalNotificationKind kind,
    required String title,
    required String body,
  }) async {
    await _run(
      () => widget.notificationService.schedule(
        id: id,
        kind: kind,
        scheduledAt: DateTime.now().add(const Duration(seconds: 5)),
        content: LocalNotificationContent(title: title, body: body),
      ),
    );
  }

  Future<void> _run(Future<void> Function() action) async {
    final localizations = AppLocalizations.of(context);
    setState(() => _isBusy = true);
    try {
      await action();
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(localizations.saved)));
      }
    } on Object catch (error) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(error.toString())));
      }
    } finally {
      if (mounted) {
        setState(() => _isBusy = false);
      }
    }
  }
}
