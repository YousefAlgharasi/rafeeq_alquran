import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../logic/entity/favorite_type.dart';
import '../../logic/provider/favorites_provider.dart';

class FavoriteButton extends ConsumerWidget {
  const FavoriteButton({
    required this.type,
    required this.itemKey,
    this.label,
    this.compact = false,
    super.key,
  });

  final FavoriteType type;
  final String itemKey;
  final String? label;
  final bool compact;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final request = FavoriteStatusRequest(type: type, itemKey: itemKey);
    final status = ref.watch(favoriteStatusProvider(request));
    final isSaved = status.value ?? false;
    final tooltip = isSaved
        ? localizations.removeFavorite
        : localizations.addFavorite;

    return SizedBox.square(
      dimension: compact ? 48 : 56,
      child: IconButton(
        tooltip: tooltip,
        onPressed: status.isLoading
            ? null
            : () => ref
                  .read(favoritesControllerProvider)
                  .toggle(type: type, itemKey: itemKey, label: label),
        icon: Icon(
          isSaved ? Icons.favorite : Icons.favorite_border,
          color: isSaved ? Theme.of(context).colorScheme.primary : null,
        ),
      ),
    );
  }
}

class ReadingBookmarkButton extends ConsumerWidget {
  const ReadingBookmarkButton({required this.verseKey, this.label, super.key});

  final String verseKey;
  final String? label;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final request = FavoriteStatusRequest(
      type: FavoriteType.readingBookmark,
      itemKey: verseKey,
    );
    final status = ref.watch(favoriteStatusProvider(request));
    final isSaved = status.value ?? false;

    return SizedBox.square(
      dimension: 48,
      child: IconButton(
        tooltip: isSaved
            ? localizations.readingBookmarkSaved
            : localizations.saveReadingBookmark,
        onPressed: status.isLoading
            ? null
            : () => ref
                  .read(favoritesControllerProvider)
                  .saveReadingBookmark(verseKey: verseKey, label: label),
        icon: Icon(
          isSaved ? Icons.bookmark : Icons.bookmark_add_outlined,
          color: isSaved ? Theme.of(context).colorScheme.primary : null,
        ),
      ),
    );
  }
}
