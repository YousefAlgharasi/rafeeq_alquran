import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../logic/entity/share_ayah_content.dart';

class ShareAyahImageCard extends StatelessWidget {
  const ShareAyahImageCard({required this.content, super.key});

  final ShareAyahContent content;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context);
    final colorScheme = theme.colorScheme;
    final tafsirSnippet = content.tafsirSnippet;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: 420,
        constraints: const BoxConstraints(minHeight: 420),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFCF4),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFFE0D5BD)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              content.surahName,
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: theme.textTheme.titleLarge?.copyWith(
                color: colorScheme.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              content.verse.verseKey,
              textAlign: TextAlign.center,
              textDirection: TextDirection.ltr,
              style: theme.textTheme.labelLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              content.verse.textArabic,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              softWrap: true,
              style: theme.textTheme.headlineSmall?.copyWith(
                height: 1.9,
                fontWeight: FontWeight.w600,
                color: colorScheme.onSurface,
              ),
            ),
            if (tafsirSnippet != null) ...[
              const SizedBox(height: 22),
              const Divider(color: Color(0xFFE0D5BD)),
              const SizedBox(height: 14),
              Text(
                localizations.tafsir,
                textAlign: TextAlign.right,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                tafsirSnippet,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                softWrap: true,
                style: theme.textTheme.bodyLarge?.copyWith(
                  height: 1.7,
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                localizations.appName,
                textDirection: localizations.textDirection,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
