import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/responsive/responsive_breakpoints.dart';
import '../../logic/entity/favorite_entry.dart';
import '../../logic/entity/favorite_type.dart';
import '../../logic/provider/favorites_provider.dart';

class FavoritesPage extends ConsumerStatefulWidget {
  const FavoritesPage({super.key});

  @override
  ConsumerState<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends ConsumerState<FavoritesPage> {
  FavoriteType? _selectedType;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final favorites = ref.watch(favoritesProvider(_selectedType));

    return Scaffold(
      appBar: AppBar(title: Text(localizations.favorites)),
      body: SafeArea(
        top: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: ResponsiveBreakpoints.maxContentWidth,
                ),
                child: CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: EdgeInsets.fromLTRB(
                        constraints.maxWidth >=
                                ResponsiveBreakpoints.wideNavigation
                            ? 32
                            : 16,
                        16,
                        constraints.maxWidth >=
                                ResponsiveBreakpoints.wideNavigation
                            ? 32
                            : 16,
                        8,
                      ),
                      sliver: SliverToBoxAdapter(
                        child: _FavoriteFilters(
                          selectedType: _selectedType,
                          onSelected: (type) {
                            setState(() => _selectedType = type);
                          },
                        ),
                      ),
                    ),
                    favorites.when(
                      data: (items) {
                        if (items.isEmpty) {
                          return SliverFillRemaining(
                            hasScrollBody: false,
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(24),
                                child: Text(
                                  localizations.noFavorites,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          );
                        }

                        return SliverPadding(
                          padding: EdgeInsets.fromLTRB(
                            constraints.maxWidth >=
                                    ResponsiveBreakpoints.wideNavigation
                                ? 32
                                : 16,
                            8,
                            constraints.maxWidth >=
                                    ResponsiveBreakpoints.wideNavigation
                                ? 32
                                : 16,
                            16,
                          ),
                          sliver: SliverList.separated(
                            itemBuilder: (context, index) {
                              return _FavoriteListTile(entry: items[index]);
                            },
                            separatorBuilder: (context, index) {
                              return const SizedBox(height: 8);
                            },
                            itemCount: items.length,
                          ),
                        );
                      },
                      loading: () => const SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                      error: (error, stackTrace) => SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Text(localizations.noFavorites),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _FavoriteFilters extends StatelessWidget {
  const _FavoriteFilters({
    required this.selectedType,
    required this.onSelected,
  });

  final FavoriteType? selectedType;
  final ValueChanged<FavoriteType?> onSelected;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final filters = <FavoriteType?>[
      null,
      FavoriteType.ayah,
      FavoriteType.tafsir,
      FavoriteType.adhkar,
      FavoriteType.reflectionNote,
      FavoriteType.readingBookmark,
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final type in filters)
          FilterChip(
            selected: selectedType == type,
            onSelected: (_) => onSelected(type),
            label: Text(
              type == null
                  ? localizations.allFavorites
                  : type.label(localizations),
            ),
          ),
      ],
    );
  }
}

class _FavoriteListTile extends ConsumerWidget {
  const _FavoriteListTile({required this.entry});

  final FavoriteEntry entry;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Card(
      child: ListTile(
        minVerticalPadding: 12,
        leading: Icon(_iconFor(entry.type)),
        title: Text(entry.label ?? entry.itemKey),
        subtitle: Text(
          '${entry.type.label(localizations)}  ${entry.itemKey}',
          style: theme.textTheme.bodySmall,
        ),
        trailing: SizedBox.square(
          dimension: 48,
          child: IconButton(
            tooltip: localizations.removeFavorite,
            icon: const Icon(Icons.delete_outline),
            onPressed: () async {
              await ref
                  .read(favoritesControllerProvider)
                  .toggle(
                    type: entry.type,
                    itemKey: entry.itemKey,
                    label: entry.label,
                  );
            },
          ),
        ),
      ),
    );
  }

  IconData _iconFor(FavoriteType type) {
    return switch (type) {
      FavoriteType.ayah => Icons.menu_book_outlined,
      FavoriteType.tafsir => Icons.notes_outlined,
      FavoriteType.adhkar => Icons.format_list_numbered_rtl_outlined,
      FavoriteType.reflectionNote => Icons.edit_note_outlined,
      FavoriteType.readingBookmark => Icons.bookmark_border_outlined,
    };
  }
}
