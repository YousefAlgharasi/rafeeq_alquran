import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../favorites/logic/entity/favorite_type.dart';
import '../../../favorites/ui/widgets/favorite_button.dart';
import '../../../reflection_notes/logic/entity/reflection_note_source_type.dart';
import '../../../reflection_notes/ui/widgets/reflection_notes_panel.dart';
import '../../../settings/logic/provider/settings_provider.dart';
import '../../../share_ayah/ui/widgets/share_ayah_button.dart';
import '../../../tafsir/ui/widgets/ayah_tafsir_panel.dart';
import '../../logic/entity/quran_verse.dart';
import 'ayah_audio_button.dart';

class AyahCard extends ConsumerStatefulWidget {
  const AyahCard({required this.verse, required this.onVisible, super.key});

  final QuranVerse verse;
  final VoidCallback onVisible;

  @override
  ConsumerState<AyahCard> createState() => _AyahCardState();
}

class _AyahCardState extends ConsumerState<AyahCard> {
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
    final showTranslations = ref.watch(showTranslationsProvider).value ?? true;

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
            if (showTranslations && widget.verse.translationText != null) ...[
              const SizedBox(height: 12),
              Text(widget.verse.translationText!),
            ],
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.verse.verseKey,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                FavoriteButton(
                  type: FavoriteType.ayah,
                  itemKey: widget.verse.verseKey,
                  label: widget.verse.verseKey,
                  compact: true,
                ),
                ReadingBookmarkButton(
                  verseKey: widget.verse.verseKey,
                  label: widget.verse.verseKey,
                ),
                AyahAudioButton(verseKey: widget.verse.verseKey),
                ShareAyahButton(verse: widget.verse),
              ],
            ),
            const SizedBox(height: 4),
            AyahTafsirPanel(verseKey: widget.verse.verseKey),
            ReflectionNotesPanel(
              verseKey: widget.verse.verseKey,
              sourceType: ReflectionNoteSourceType.quranAyah,
            ),
          ],
        ),
      ),
    );
  }
}
