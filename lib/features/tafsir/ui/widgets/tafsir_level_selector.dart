import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../logic/entity/tafsir_level.dart';
import '../../logic/entity/tafsir_resource.dart';

class TafsirLevelSelector extends StatelessWidget {
  const TafsirLevelSelector({
    required this.resources,
    required this.selectedLevel,
    required this.onSelected,
    super.key,
  });

  final List<TafsirResource> resources;
  final TafsirLevel selectedLevel;
  final ValueChanged<TafsirLevel> onSelected;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: TafsirLevel.values.map((level) {
        final resource = resources.where((item) => item.level == level).firstOrNull;
        final available = resource?.isAvailable ?? false;
        return ChoiceChip(
          label: Text(
            available
                ? level.label(isArabic: localizations.isArabic)
                : '${level.label(isArabic: localizations.isArabic)} · ${localizations.comingSoon}',
          ),
          selected: selectedLevel == level,
          onSelected: available ? (_) => onSelected(level) : null,
          labelStyle: theme.textTheme.labelMedium,
        );
      }).toList(),
    );
  }
}
