import 'package:flutter/material.dart';

import '../../../tafsir/ui/widgets/ayah_tafsir_panel.dart';
import '../../logic/entity/quran_verse.dart';

class AyahCard extends StatefulWidget {
  const AyahCard({
    required this.verse,
    required this.onVisible,
    super.key,
  });

  final QuranVerse verse;
  final VoidCallback onVisible;

  @override
  State<AyahCard> createState() => _AyahCardState();
}

class _AyahCardState extends State<AyahCard> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        widget.onVisible();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget.verse.textArabic,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: theme.textTheme.headlineSmall?.copyWith(
                height: 1.8,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (widget.verse.translationText != null) ...[
              const SizedBox(height: 12),
              Text(widget.verse.translationText!),
            ],
            const SizedBox(height: 12),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                widget.verse.verseKey,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 4),
            AyahTafsirPanel(verseKey: widget.verse.verseKey),
          ],
        ),
      ),
    );
  }
}
