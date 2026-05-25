import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../favorites/logic/entity/favorite_type.dart';
import '../../../favorites/ui/widgets/favorite_button.dart';
import '../../logic/entity/tafsir_level.dart';
import '../../logic/provider/tafsir_provider.dart';
import 'tafsir_level_selector.dart';

class AyahTafsirPanel extends ConsumerStatefulWidget {
  const AyahTafsirPanel({required this.verseKey, super.key});

  final String verseKey;

  @override
  ConsumerState<AyahTafsirPanel> createState() => _AyahTafsirPanelState();
}

class _AyahTafsirPanelState extends ConsumerState<AyahTafsirPanel> {
  TafsirLevel _selectedLevel = TafsirLevel.alMuyassar;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final resources = ref.watch(tafsirResourcesProvider);
    final tafsir = ref.watch(alMuyassarTafsirProvider(widget.verseKey));
    final theme = Theme.of(context);

    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      childrenPadding: const EdgeInsets.only(top: 8),
      title: Text(localizations.tafsir),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FavoriteButton(
            type: FavoriteType.tafsir,
            itemKey: widget.verseKey,
            label: widget.verseKey,
            compact: true,
          ),
          const Icon(Icons.expand_more),
        ],
      ),
      children: [
        resources.when(
          data: (items) => TafsirLevelSelector(
            resources: items,
            selectedLevel: _selectedLevel,
            onSelected: (level) {
              setState(() => _selectedLevel = level);
            },
          ),
          loading: () => const Align(
            alignment: AlignmentDirectional.centerStart,
            child: SizedBox.square(
              dimension: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
          error: (error, stackTrace) => Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(localizations.tafsirUnavailable),
          ),
        ),
        const SizedBox(height: 12),
        if (_selectedLevel == TafsirLevel.alMuyassar)
          tafsir.when(
            data: (entry) => SelectableText(
              entry.text,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: theme.textTheme.bodyLarge?.copyWith(height: 1.7),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(localizations.tafsirUnavailable),
            ),
          )
        else
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(localizations.tafsirLevelUnavailable),
          ),
      ],
    );
  }
}
