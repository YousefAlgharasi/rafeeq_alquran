import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../favorites/logic/entity/favorite_type.dart';
import '../../../favorites/ui/widgets/favorite_button.dart';
import '../../../quran_content/ui/widgets/ayah_audio_button.dart';
import '../../../reflection_notes/logic/entity/reflection_note_source_type.dart';
import '../../../reflection_notes/ui/widgets/reflection_notes_panel.dart';
import '../../../settings/logic/provider/settings_provider.dart';
import '../../../share_ayah/ui/widgets/share_ayah_button.dart';
import '../../logic/entity/daily_ayah.dart';
import '../../logic/provider/daily_ayah_provider.dart';

class DailyAyahCard extends ConsumerWidget {
  const DailyAyahCard({
    required this.dailyAyah,
    this.compact = false,
    super.key,
  });

  final DailyAyah dailyAyah;
  final bool compact;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context);
    final verse = dailyAyah.verse;
    final showTranslations = ref.watch(showTranslationsProvider).value ?? true;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Wrap(
              spacing: 8,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.spaceBetween,
              children: [
                Text(
                  localizations.todayAyah,
                  style: theme.textTheme.titleMedium,
                ),
                if (dailyAyah.wasRead)
                  Semantics(
                    label: localizations.ayahRead,
                    child: Chip(
                      avatar: const Icon(Icons.check_circle_outline, size: 18),
                      label: Text(localizations.ayahRead),
                    ),
                  )
                else
                  TextButton.icon(
                    onPressed: () async {
                      await ref
                          .read(dailyAyahRepositoryProvider)
                          .markAsRead(date: dailyAyah.selectedDate);
                      ref.invalidate(dailyAyahProvider);
                    },
                    icon: const Icon(Icons.check_outlined),
                    label: Text(localizations.markAyahRead),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              verse.textArabic,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              maxLines: compact ? 4 : null,
              overflow: compact ? TextOverflow.ellipsis : null,
              style: theme.textTheme.headlineSmall?.copyWith(
                height: 1.8,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (!compact &&
                showTranslations &&
                verse.translationText != null) ...[
              const SizedBox(height: 12),
              Text(verse.translationText!),
            ],
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: Text(
                    verse.verseKey,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                AyahAudioButton(verseKey: verse.verseKey),
                ShareAyahButton(
                  verse: verse,
                  tafsir: dailyAyah.tafsir,
                  loadTafsir: false,
                ),
                FavoriteButton(
                  type: FavoriteType.ayah,
                  itemKey: verse.verseKey,
                  label: verse.verseKey,
                  compact: true,
                ),
                if (compact)
                  IconButton(
                    tooltip: localizations.tafsir,
                    onPressed: () {
                      context.go(AppRouteDestination.dailyAyah.path);
                    },
                    icon: const Icon(Icons.menu_book_outlined),
                  ),
              ],
            ),
            if (!compact && dailyAyah.tafsir != null) ...[
              const Divider(height: 24),
              Text(localizations.tafsir, style: theme.textTheme.titleSmall),
              const SizedBox(height: 8),
              Text(dailyAyah.tafsir!.text),
            ],
            if (!compact)
              ReflectionNotesPanel(
                verseKey: verse.verseKey,
                sourceType: ReflectionNoteSourceType.dailyAyah,
              ),
          ],
        ),
      ),
    );
  }
}
