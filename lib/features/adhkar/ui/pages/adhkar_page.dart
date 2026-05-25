import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/responsive/responsive_breakpoints.dart';
import '../../logic/entity/adhkar_category_progress.dart';
import '../../logic/provider/adhkar_provider.dart';

class AdhkarPage extends ConsumerWidget {
  const AdhkarPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final categories = ref.watch(adhkarAllCategoryProgressProvider);

    return Scaffold(
      appBar: AppBar(title: Text(localizations.adhkar)),
      body: SafeArea(
        top: false,
        child: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(adhkarAllCategoryProgressProvider);
            await ref.read(adhkarAllCategoryProgressProvider.future);
          },
          child: categories.when(
            data: (items) => LayoutBuilder(
              builder: (context, constraints) {
                final useWide =
                    constraints.maxWidth >=
                    ResponsiveBreakpoints.wideNavigation;
                final columns = constraints.maxWidth >= 840 ? 2 : 1;

                return GridView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: useWide ? 32 : 16,
                    vertical: 16,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: columns,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    mainAxisExtent: 154,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return _AdhkarCategoryTile(
                      progress: items[index],
                      onTap: () {
                        context.go('/adhkar/${items[index].category.key}');
                      },
                    );
                  },
                );
              },
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (error, stackTrace) => _AdhkarErrorState(
              onRetry: () => ref.invalidate(adhkarAllCategoryProgressProvider),
            ),
          ),
        ),
      ),
    );
  }
}

class _AdhkarCategoryTile extends StatelessWidget {
  const _AdhkarCategoryTile({required this.progress, required this.onTap});

  final AdhkarCategoryProgress progress;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final title = localizations.isArabic
        ? progress.category.titleArabic
        : progress.category.titleEnglish ?? progress.category.titleArabic;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  if (progress.isCompleted)
                    Icon(Icons.check_circle, color: colorScheme.primary),
                ],
              ),
              const Spacer(),
              Text(
                localizations.adhkarCategoryProgress(
                  progress.completedItems,
                  progress.totalItems,
                ),
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              LinearProgressIndicator(value: progress.progressValue),
            ],
          ),
        ),
      ),
    );
  }
}

class _AdhkarErrorState extends StatelessWidget {
  const _AdhkarErrorState({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Center(
          child: FilledButton(
            onPressed: onRetry,
            child: Text(localizations.retry),
          ),
        ),
      ],
    );
  }
}
