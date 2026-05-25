import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../favorites/logic/entity/favorite_type.dart';
import '../../../favorites/ui/widgets/favorite_button.dart';
import '../../logic/entity/adhkar_item_progress.dart';

class AdhkarItemCounterCard extends StatelessWidget {
  const AdhkarItemCounterCard({
    required this.itemProgress,
    required this.onIncrement,
    super.key,
  });

  final AdhkarItemProgress itemProgress;
  final Future<void> Function() onIncrement;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final item = itemProgress.item;

    return Card(
      color: itemProgress.isCompleted
          ? colorScheme.primaryContainer
          : colorScheme.surface,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              item.textArabic,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: theme.textTheme.titleLarge?.copyWith(height: 1.7),
            ),
            if (item.textEnglish != null && !localizations.isArabic) ...[
              const SizedBox(height: 12),
              Text(item.textEnglish!),
            ],
            const SizedBox(height: 12),
            Text(
              'Source: ${item.sourceReference}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: FavoriteButton(
                type: FavoriteType.adhkar,
                itemKey: item.key,
                label: item.categoryKey,
                compact: true,
              ),
            ),
            const SizedBox(height: 16),
            _CounterButton(
              counterText: itemProgress.counterText,
              isCompleted: itemProgress.isCompleted,
              onPressed: itemProgress.isCompleted ? null : onIncrement,
            ),
          ],
        ),
      ),
    );
  }
}

class _CounterButton extends StatefulWidget {
  const _CounterButton({
    required this.counterText,
    required this.isCompleted,
    required this.onPressed,
  });

  final String counterText;
  final bool isCompleted;
  final Future<void> Function()? onPressed;

  @override
  State<_CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<_CounterButton> {
  bool _isBusy = false;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final label = widget.isCompleted
        ? localizations.adhkarCompleted
        : localizations.adhkarTapCounter;

    return SizedBox(
      height: 64,
      child: FilledButton.icon(
        onPressed: widget.onPressed == null || _isBusy ? null : _handlePressed,
        icon: Icon(
          widget.isCompleted
              ? Icons.check_circle_outline
              : Icons.touch_app_outlined,
        ),
        label: Text('$label  ${widget.counterText}'),
      ),
    );
  }

  Future<void> _handlePressed() async {
    setState(() => _isBusy = true);
    try {
      await widget.onPressed?.call();
    } finally {
      if (mounted) {
        setState(() => _isBusy = false);
      }
    }
  }
}
