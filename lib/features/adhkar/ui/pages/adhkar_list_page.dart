import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/responsive/responsive_breakpoints.dart';
import '../../logic/provider/adhkar_provider.dart';
import '../widgets/adhkar_item_counter_card.dart';

class AdhkarListPage extends ConsumerWidget {
  const AdhkarListPage({required this.categoryKey, super.key});

  final String categoryKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final progress = ref.watch(adhkarCategoryProgressProvider(categoryKey));

    return progress.when(
      data: (categoryProgress) {
        final title = localizations.isArabic
            ? categoryProgress.category.titleArabic
            : categoryProgress.category.titleEnglish ??
                  categoryProgress.category.titleArabic;

        return Scaffold(
          appBar: AppBar(title: Text(title)),
          body: SafeArea(
            top: false,
            child: RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(adhkarCategoryProgressProvider(categoryKey));
                await ref.read(
                  adhkarCategoryProgressProvider(categoryKey).future,
                );
              },
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final useWide =
                      constraints.maxWidth >=
                      ResponsiveBreakpoints.wideNavigation;

                  return ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: useWide ? 32 : 16,
                      vertical: 16,
                    ),
                    children: [
                      Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: ResponsiveBreakpoints.maxContentWidth,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              _CategoryProgressHeader(
                                completed: categoryProgress.completedItems,
                                total: categoryProgress.totalItems,
                                value: categoryProgress.progressValue,
                              ),
                              const SizedBox(height: 12),
                              if (categoryProgress.items.isEmpty)
                                _EmptyAdhkarItems(
                                  message: localizations.adhkarNoItems,
                                )
                              else
                                for (final itemProgress
                                    in categoryProgress.items)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: AdhkarItemCounterCard(
                                      itemProgress: itemProgress,
                                      onIncrement: () {
                                        return ref
                                            .read(
                                              adhkarCounterControllerProvider,
                                            )
                                            .increment(itemProgress.item);
                                      },
                                    ),
                                  ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
      loading: () => Scaffold(
        appBar: AppBar(title: Text(localizations.adhkar)),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (error, stackTrace) => Scaffold(
        appBar: AppBar(title: Text(localizations.adhkar)),
        body: Center(
          child: FilledButton(
            onPressed: () {
              ref.invalidate(adhkarCategoryProgressProvider(categoryKey));
            },
            child: Text(localizations.retry),
          ),
        ),
      ),
    );
  }
}

class _CategoryProgressHeader extends StatelessWidget {
  const _CategoryProgressHeader({
    required this.completed,
    required this.total,
    required this.value,
  });

  final int completed;
  final int total;
  final double value;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              localizations.adhkarProgress,
              style: theme.textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(localizations.adhkarCategoryProgress(completed, total)),
            const SizedBox(height: 12),
            LinearProgressIndicator(value: value),
          ],
        ),
      ),
    );
  }
}

class _EmptyAdhkarItems extends StatelessWidget {
  const _EmptyAdhkarItems({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(message, textAlign: TextAlign.center),
      ),
    );
  }
}
