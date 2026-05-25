import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/app_routes.dart';
import '../../logic/provider/daily_ayah_provider.dart';

class DailyAyahUnavailableCard extends ConsumerWidget {
  const DailyAyahUnavailableCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(localizations.todayAyah, style: theme.textTheme.titleMedium),
            const SizedBox(height: 12),
            Container(
              constraints: const BoxConstraints(minHeight: 140),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: theme.colorScheme.outlineVariant),
                color: theme.colorScheme.surface,
              ),
              child: Center(
                child: Text(
                  localizations.ayahTextUnavailable,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(height: 1.5),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                FilledButton.icon(
                  onPressed: () => ref.invalidate(dailyAyahProvider),
                  icon: const Icon(Icons.refresh_outlined),
                  label: Text(localizations.retry),
                ),
                OutlinedButton.icon(
                  onPressed: () => context.go(AppRouteDestination.quran.path),
                  icon: const Icon(Icons.menu_book_outlined),
                  label: Text(localizations.quran),
                ),
              ],
            ),
            const Divider(height: 28),
            _UnavailableActionRow(
              icon: Icons.check_outlined,
              label: localizations.markAyahRead,
            ),
            _UnavailableActionRow(
              icon: Icons.volume_up_outlined,
              label: localizations.playRecitation,
            ),
            _UnavailableActionRow(
              icon: Icons.ios_share_outlined,
              label: localizations.shareAyahAsImage,
            ),
            _UnavailableActionRow(
              icon: Icons.notes_outlined,
              label: localizations.reflectionNotes,
            ),
            const SizedBox(height: 8),
            Text(
              localizations.dailyAyahUnavailableDetail,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UnavailableActionRow extends StatelessWidget {
  const _UnavailableActionRow({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(width: 12),
          Expanded(child: Text(label)),
          Chip(label: Text(AppLocalizations.of(context).waitingForAyah)),
        ],
      ),
    );
  }
}
