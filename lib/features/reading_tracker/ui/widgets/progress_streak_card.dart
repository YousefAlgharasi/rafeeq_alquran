import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../daily_goal/logic/entity/reading_goal_type.dart';
import '../../../daily_goal/ui/widgets/goal_type_label.dart';
import '../../logic/entity/reading_progress_summary.dart';
import '../../logic/provider/reading_tracker_provider.dart';

class ProgressStreakCard extends ConsumerWidget {
  const ProgressStreakCard({
    required this.summary,
    super.key,
  });

  final ReadingProgressSummary summary;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final goal = summary.todayGoal;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              localizations.readingProgress,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(value: goal.completionRatio),
            const SizedBox(height: 8),
            Text(
              '${localizations.dailyGoal}: ${goal.goalType.label(context)}',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 8,
              children: [
                _MetricChip(
                  label: localizations.currentStreak,
                  value: summary.streak.currentStreak.toString(),
                ),
                _MetricChip(
                  label: localizations.longestStreak,
                  value: summary.streak.longestStreak.toString(),
                ),
                _MetricChip(
                  label: localizations.missedDays,
                  value: summary.streak.missedDays.toString(),
                ),
              ],
            ),
            const SizedBox(height: 12),
            DropdownButtonFormField<ReadingGoalType>(
              initialValue: goal.goalType,
              decoration: InputDecoration(labelText: localizations.goalSettings),
              items: [
                for (final type in ReadingGoalType.values)
                  DropdownMenuItem(
                    value: type,
                    child: Text(type.label(context)),
                  ),
              ],
              onChanged: (type) async {
                if (type == null) {
                  return;
                }
                await ref.read(readingTrackerRepositoryProvider).setGoalType(
                      type,
                    );
                ref.invalidate(readingProgressSummaryProvider);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricChip extends StatelessWidget {
  const _MetricChip({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text('$label: $value'),
    );
  }
}
