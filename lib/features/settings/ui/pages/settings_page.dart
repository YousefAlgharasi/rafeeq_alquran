import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/notifications/local_notification_service.dart';
import '../../../../core/responsive/responsive_breakpoints.dart';
import '../../../../core/sync/sync_providers.dart';
import '../../../adhan_notifications/logic/entity/adhan_notification_settings.dart';
import '../../../adhan_notifications/logic/provider/adhan_notification_provider.dart';
import '../../../adhan_notifications/ui/widgets/adhan_notification_settings_card.dart';
import '../../../auth/logic/entity/auth_session.dart';
import '../../../auth/logic/provider/auth_provider.dart';
import '../../../daily_goal/logic/entity/reading_goal_type.dart';
import '../../../daily_goal/ui/widgets/goal_type_label.dart';
import '../../../prayer_times/logic/entity/prayer_day.dart';
import '../../../prayer_times/logic/provider/prayer_times_provider.dart';
import '../../../prayer_times/ui/widgets/next_prayer_countdown_card.dart';
import '../../../prayer_times/ui/widgets/prayer_times_settings_card.dart';
import '../../../quran_reminders/logic/entity/quran_reminder_slot.dart';
import '../../../quran_reminders/logic/provider/quran_reminder_provider.dart';
import '../../../reading_tracker/logic/provider/reading_tracker_provider.dart';
import '../../logic/entity/app_language.dart';
import '../../logic/provider/settings_provider.dart';
import '../widgets/debug_notification_test_card.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final session = ref.watch(authSessionProvider);
    final prayerSettings = ref.watch(prayerSettingsProvider);
    final prayerDay = ref.watch(todayPrayerTimesProvider);
    final adhanSettings = ref.watch(adhanNotificationSettingsProvider);
    final goalType = ref.watch(readingGoalTypeProvider);

    return Scaffold(
      appBar: AppBar(title: Text(localizations.settings)),
      body: SafeArea(
        top: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal:
                    constraints.maxWidth >= ResponsiveBreakpoints.wideNavigation
                    ? 32
                    : 16,
                vertical: 16,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: ResponsiveBreakpoints.maxContentWidth,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _LanguageSection(),
                      const SizedBox(height: 16),
                      _QuranDisplaySection(),
                      const SizedBox(height: 16),
                      _AccountSection(session: session),
                      const SizedBox(height: 16),
                      const _NotificationPermissionSection(),
                      const SizedBox(height: 16),
                      _QuranReminderSection(),
                      const SizedBox(height: 16),
                      prayerSettings.when(
                        data: (settings) => PrayerTimesSettingsCard(
                          settings: settings,
                          onSave: (settings) async {
                            await ref
                                .read(prayerSettingsControllerProvider)
                                .save(settings);
                            final day = await ref.read(
                              todayPrayerTimesProvider.future,
                            );
                            await _refreshAdhanSchedules(
                              ref: ref,
                              localizations: localizations,
                              prayerDay: day,
                            );
                          },
                          onUseCurrentLocation: () async {
                            await ref
                                .read(prayerSettingsControllerProvider)
                                .useCurrentLocation();
                            final day = await ref.read(
                              todayPrayerTimesProvider.future,
                            );
                            await _refreshAdhanSchedules(
                              ref: ref,
                              localizations: localizations,
                              prayerDay: day,
                            );
                          },
                        ),
                        loading: () => _LoadingSection(
                          title: localizations.prayerLocation,
                        ),
                        error: (error, stackTrace) => _ErrorSection(
                          title: localizations.prayerLocation,
                          message: localizations.noPrayerTimesCached,
                        ),
                      ),
                      const SizedBox(height: 16),
                      adhanSettings.when(
                        data: (settings) => AdhanNotificationSettingsCard(
                          settings: settings,
                          prayerDay: prayerDay.whenOrNull(
                            data: (value) => value,
                          ),
                          onAdhanChanged: (prayerName, isEnabled) async {
                            await _requestNotificationPermission(ref);
                            await ref
                                .read(adhanNotificationControllerProvider)
                                .setAdhanEnabled(prayerName, isEnabled);
                            final day = prayerDay.asData?.value;
                            if (day != null) {
                              await _refreshAdhanSchedules(
                                ref: ref,
                                localizations: localizations,
                                prayerDay: day,
                              );
                            }
                          },
                          onPrePrayerChanged: (isEnabled) async {
                            await _requestNotificationPermission(ref);
                            await ref
                                .read(adhanNotificationControllerProvider)
                                .setPrePrayerEnabled(isEnabled);
                            final day = prayerDay.asData?.value;
                            if (day != null) {
                              await _refreshAdhanSchedules(
                                ref: ref,
                                localizations: localizations,
                                prayerDay: day,
                              );
                            }
                          },
                          onVibrationChanged: (isEnabled) async {
                            await ref
                                .read(adhanNotificationControllerProvider)
                                .setVibrationEnabled(isEnabled);
                            final day = prayerDay.asData?.value;
                            if (day != null) {
                              await _refreshAdhanSchedules(
                                ref: ref,
                                localizations: localizations,
                                prayerDay: day,
                              );
                            }
                          },
                          onRefreshSchedules: (day) {
                            return _refreshAdhanSchedules(
                              ref: ref,
                              localizations: localizations,
                              prayerDay: day,
                            );
                          },
                        ),
                        loading: () => _LoadingSection(
                          title: localizations.adhanNotifications,
                        ),
                        error: (error, stackTrace) => _AdhanFallbackSection(),
                      ),
                      const SizedBox(height: 16),
                      _DailyGoalSection(goalType: goalType),
                      const SizedBox(height: 16),
                      _SyncStatusSection(session: session),
                      const SizedBox(height: 16),
                      DebugNotificationTestCard(
                        notificationService: ref.watch(
                          localNotificationServiceProvider,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<int> _refreshAdhanSchedules({
    required WidgetRef ref,
    required AppLocalizations localizations,
    required PrayerDay prayerDay,
  }) {
    return ref
        .read(adhanNotificationControllerProvider)
        .refreshSchedules(
          prayerDay: prayerDay,
          prayerLabelBuilder: (prayerName) =>
              prayerNameLabel(localizations, prayerName),
          adhanTitle: localizations.adhanNotifications,
          adhanBodyBuilder: localizations.adhanNotificationBody,
          prePrayerTitle: localizations.prePrayerNotifications,
          prePrayerBodyBuilder: localizations.prePrayerNotificationBody,
        );
  }

  Future<void> _requestNotificationPermission(WidgetRef ref) async {
    await ref.read(localNotificationServiceProvider).requestPermission();
  }
}

class _LanguageSection extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final selectedLanguage =
        ref.watch(appLanguageProvider).value ?? AppLanguage.english;

    return _SectionCard(
      title: localizations.language,
      child: SegmentedButton<AppLanguage>(
        segments: [
          ButtonSegment(
            value: AppLanguage.english,
            label: Text(localizations.english),
          ),
          ButtonSegment(
            value: AppLanguage.arabic,
            label: Text(localizations.arabic),
          ),
        ],
        selected: {selectedLanguage},
        onSelectionChanged: (selection) {
          ref.read(appLanguageProvider.notifier).setLanguage(selection.first);
        },
      ),
    );
  }
}

class _QuranDisplaySection extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final showTranslations = ref.watch(showTranslationsProvider).value ?? true;

    return _SectionCard(
      title: localizations.quranDisplay,
      child: SwitchListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(localizations.showTranslations),
        subtitle: Text(localizations.showTranslationsDescription),
        value: showTranslations,
        secondary: const Icon(Icons.translate_outlined),
        onChanged: (value) {
          ref
              .read(showTranslationsProvider.notifier)
              .setShowTranslations(value);
        },
      ),
    );
  }
}

class _AccountSection extends ConsumerWidget {
  const _AccountSection({required this.session});

  final AsyncValue<AuthSession> session;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);

    return _SectionCard(
      title: localizations.account,
      child: session.when(
        data: (data) {
          final user = data.user;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                data.isLoggedIn
                    ? localizations.loggedIn
                    : localizations.guestMode,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                data.isLoggedIn
                    ? (user?.email ??
                          user?.displayName ??
                          localizations.profile)
                    : localizations.loginOptionalMessage,
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  FilledButton.icon(
                    onPressed: () =>
                        context.go(data.isLoggedIn ? '/profile' : '/login'),
                    icon: Icon(
                      data.isLoggedIn
                          ? Icons.person_outline
                          : Icons.login_outlined,
                    ),
                    label: Text(
                      data.isLoggedIn
                          ? localizations.openProfile
                          : localizations.login,
                    ),
                  ),
                  if (data.isLoggedIn)
                    OutlinedButton.icon(
                      onPressed: () {
                        ref.read(authRepositoryProvider).signOut();
                      },
                      icon: const Icon(Icons.logout_outlined),
                      label: Text(localizations.logout),
                    ),
                ],
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(localizations.guestMode),
            const SizedBox(height: 8),
            Text(localizations.firebaseNotConfiguredMessage),
            const SizedBox(height: 12),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: FilledButton.icon(
                onPressed: () => context.go('/login'),
                icon: const Icon(Icons.login_outlined),
                label: Text(localizations.login),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationPermissionSection extends ConsumerStatefulWidget {
  const _NotificationPermissionSection();

  @override
  ConsumerState<_NotificationPermissionSection> createState() =>
      _NotificationPermissionSectionState();
}

class _NotificationPermissionSectionState
    extends ConsumerState<_NotificationPermissionSection> {
  late Future<LocalNotificationPermissionStatus> _statusFuture;

  @override
  void initState() {
    super.initState();
    _statusFuture = _loadStatus();
  }

  Future<LocalNotificationPermissionStatus> _loadStatus() {
    return ref.read(localNotificationServiceProvider).permissionStatus();
  }

  Future<void> _refresh() async {
    setState(() {
      _statusFuture = _loadStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return _SectionCard(
      title: localizations.notificationPermission,
      child: FutureBuilder<LocalNotificationPermissionStatus>(
        future: _statusFuture,
        builder: (context, snapshot) {
          final status =
              snapshot.data ?? LocalNotificationPermissionStatus.unknown;
          final enabled = status.canNotify;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  enabled
                      ? Icons.notifications_active_outlined
                      : Icons.notifications_off_outlined,
                ),
                title: Text(
                  enabled
                      ? localizations.notificationsEnabled
                      : localizations.notificationsDisabled,
                ),
                subtitle: enabled
                    ? null
                    : Text(localizations.notificationsPermissionNeeded),
              ),
              if (!enabled) ...[
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    FilledButton.icon(
                      onPressed: () async {
                        await ref
                            .read(localNotificationServiceProvider)
                            .requestPermission();
                        await _refresh();
                      },
                      icon: const Icon(Icons.notifications_outlined),
                      label: Text(localizations.enableNotifications),
                    ),
                    OutlinedButton.icon(
                      onPressed: () async {
                        await ref
                            .read(localNotificationServiceProvider)
                            .openSettings();
                        await _refresh();
                      },
                      icon: const Icon(Icons.settings_outlined),
                      label: Text(localizations.openNotificationSettings),
                    ),
                  ],
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}

class _QuranReminderSection extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final reminders = ref.watch(quranReminderSettingsProvider);

    return _SectionCard(
      title: localizations.quranReminders,
      child: reminders.when(
        data: (settings) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(localizations.enableQuranReminders),
              subtitle: Text(
                settings.isEnabled
                    ? localizations.quranRemindersOn
                    : localizations.quranRemindersOff,
              ),
              value: settings.isEnabled,
              onChanged: (value) => _setEnabled(
                ref: ref,
                localizations: localizations,
                isEnabled: value,
              ),
            ),
            const Divider(),
            Text(
              localizations.reminderTimeSlots,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            for (final slot in settings.slots) _ReminderSlotTile(slot: slot),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Text(localizations.quranRemindersOff),
      ),
    );
  }

  Future<void> _setEnabled({
    required WidgetRef ref,
    required AppLocalizations localizations,
    required bool isEnabled,
  }) async {
    final repository = ref.read(quranReminderRepositoryProvider);
    if (isEnabled) {
      await ref.read(localNotificationServiceProvider).requestPermission();
    }
    await repository.setEnabled(isEnabled);
    ref.invalidate(quranReminderSettingsProvider);
    await _refreshSchedules(ref, localizations);
  }

  Future<void> _refreshSchedules(
    WidgetRef ref,
    AppLocalizations localizations,
  ) async {
    final summary = await ref.read(readingProgressSummaryProvider.future);
    await ref
        .read(quranReminderRepositoryProvider)
        .refreshSchedules(
          isDailyGoalCompleted: summary.todayGoal.isCompleted,
          content: LocalNotificationContent(
            title: localizations.appName,
            body: localizations.quranReminderNotificationBody,
            payload: 'quran_reminder',
          ),
        );
  }
}

class _ReminderSlotTile extends ConsumerWidget {
  const _ReminderSlotTile({required this.slot});

  final QuranReminderSlot slot;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(_slotLabel(localizations, slot.id)),
      subtitle: Text(_slotTime(slot)),
      value: slot.isEnabled,
      secondary: IconButton(
        tooltip: localizations.reminderTimeSlots,
        icon: const Icon(Icons.schedule_outlined),
        onPressed: () => _pickTime(context, ref, localizations),
      ),
      onChanged: (value) => _saveSlot(
        ref,
        localizations: localizations,
        slot: _copySlot(slot, isEnabled: value),
      ),
    );
  }

  Future<void> _pickTime(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations localizations,
  ) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: slot.hour, minute: slot.minute),
    );
    if (picked == null) {
      return;
    }
    await _saveSlot(
      ref,
      localizations: localizations,
      slot: _copySlot(slot, hour: picked.hour, minute: picked.minute),
    );
  }

  Future<void> _saveSlot(
    WidgetRef ref, {
    required AppLocalizations localizations,
    required QuranReminderSlot slot,
  }) async {
    if (slot.isEnabled) {
      await ref.read(localNotificationServiceProvider).requestPermission();
    }
    await ref.read(quranReminderRepositoryProvider).updateSlot(slot);
    ref.invalidate(quranReminderSettingsProvider);
    final summary = await ref.read(readingProgressSummaryProvider.future);
    await ref
        .read(quranReminderRepositoryProvider)
        .refreshSchedules(
          isDailyGoalCompleted: summary.todayGoal.isCompleted,
          content: LocalNotificationContent(
            title: localizations.appName,
            body: localizations.quranReminderNotificationBody,
            payload: 'quran_reminder',
          ),
        );
  }

  QuranReminderSlot _copySlot(
    QuranReminderSlot slot, {
    int? hour,
    int? minute,
    bool? isEnabled,
  }) {
    return QuranReminderSlot(
      id: slot.id,
      anchor: slot.anchor,
      hour: hour ?? slot.hour,
      minute: minute ?? slot.minute,
      offsetMinutes: slot.offsetMinutes,
      isEnabled: isEnabled ?? slot.isEnabled,
    );
  }

  String _slotLabel(
    AppLocalizations localizations,
    QuranReminderSlotId slotId,
  ) {
    return switch (slotId) {
      QuranReminderSlotId.afterFajr => localizations.afterFajrReminder,
      QuranReminderSlotId.midday => localizations.middayReminder,
      QuranReminderSlotId.afterAsr => localizations.afterAsrReminder,
      QuranReminderSlotId.beforeSleep => localizations.beforeSleepReminder,
    };
  }

  String _slotTime(QuranReminderSlot slot) {
    final hour = slot.hour.toString().padLeft(2, '0');
    final minute = slot.minute.toString().padLeft(2, '0');
    if (slot.offsetMinutes == 0) {
      return '$hour:$minute';
    }

    return '$hour:$minute +${slot.offsetMinutes}m';
  }
}

class _AdhanFallbackSection extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = AdhanNotificationSettings.defaults();

    return AdhanNotificationSettingsCard(
      settings: settings,
      prayerDay: null,
      onAdhanChanged: ref
          .read(adhanNotificationControllerProvider)
          .setAdhanEnabled,
      onPrePrayerChanged: ref
          .read(adhanNotificationControllerProvider)
          .setPrePrayerEnabled,
      onVibrationChanged: ref
          .read(adhanNotificationControllerProvider)
          .setVibrationEnabled,
      onRefreshSchedules: (_) async => 0,
    );
  }
}

class _DailyGoalSection extends ConsumerWidget {
  const _DailyGoalSection({required this.goalType});

  final AsyncValue<ReadingGoalType> goalType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final selected = goalType.value ?? ReadingGoalType.oneAyahPerDay;

    return _SectionCard(
      title: localizations.dailyGoal,
      child: DropdownButtonFormField<ReadingGoalType>(
        initialValue: selected,
        decoration: InputDecoration(labelText: localizations.goalSettings),
        items: ReadingGoalType.values.map((type) {
          return DropdownMenuItem(
            value: type,
            child: Text(type.label(context)),
          );
        }).toList(),
        onChanged: (value) {
          if (value != null) {
            ref.read(readingGoalControllerProvider).setGoalType(value);
          }
        },
      ),
    );
  }
}

class _SyncStatusSection extends ConsumerWidget {
  const _SyncStatusSection({required this.session});

  final AsyncValue<AuthSession> session;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);

    return _SectionCard(
      title: localizations.syncStatus,
      child: session.when(
        data: (data) {
          if (!data.isLoggedIn) {
            return Text(localizations.guestMode);
          }

          final userId = data.user!.id;
          return FutureBuilder(
            future: ref
                .read(syncQueueManagerProvider)
                .pendingOperationsForUser(userId),
            builder: (context, snapshot) {
              final pendingCount = snapshot.data?.length ?? 0;
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.sync_outlined),
                title: Text(
                  pendingCount == 0
                      ? localizations.synced
                      : localizations.pendingSyncChanges(pendingCount),
                ),
                subtitle: Text(localizations.syncLaterMessage),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Text(localizations.guestMode),
      ),
    );
  }
}

class _SectionCard extends StatelessWidget {
  const _SectionCard({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}

class _LoadingSection extends StatelessWidget {
  const _LoadingSection({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(
      title: title,
      child: const Center(child: CircularProgressIndicator()),
    );
  }
}

class _ErrorSection extends StatelessWidget {
  const _ErrorSection({required this.title, required this.message});

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return _SectionCard(title: title, child: Text(message));
  }
}
