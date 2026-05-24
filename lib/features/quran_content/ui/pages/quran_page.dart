import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/responsive/responsive_breakpoints.dart';
import '../../logic/provider/quran_content_provider.dart';
import '../widgets/surah_list_tile.dart';

class QuranPage extends ConsumerWidget {
  const QuranPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final chapters = ref.watch(quranChaptersProvider);
    final lastRead = ref.watch(lastReadPositionProvider);

    return Scaffold(
      appBar: AppBar(title: Text(localizations.quran)),
      body: SafeArea(
        top: false,
        child: RefreshIndicator(
          onRefresh: () async {
            ref.invalidate(quranChaptersProvider);
            await ref.read(quranChaptersProvider.future);
          },
          child: LayoutBuilder(
            builder: (context, constraints) {
              final useWide = constraints.maxWidth >=
                  ResponsiveBreakpoints.wideNavigation;
              final horizontalPadding = useWide ? 32.0 : 16.0;

              return chapters.when(
                data: (items) {
                  if (items.isEmpty) {
                    return _EmptyQuranState(
                      message: localizations.noCachedQuran,
                      onRetry: () => ref.invalidate(quranChaptersProvider),
                    );
                  }

                  return ListView(
                    padding: EdgeInsets.symmetric(
                      horizontal: horizontalPadding,
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
                              lastRead.when(
                                data: (position) {
                                  if (position == null) {
                                    return const SizedBox.shrink();
                                  }

                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: Card(
                                      child: ListTile(
                                        title: Text(localizations.lastRead),
                                        subtitle: Text(position.verseKey),
                                        trailing: const Icon(
                                          Icons.arrow_forward_ios,
                                          size: 18,
                                        ),
                                        onTap: () => context.go(
                                          '/quran/chapter/${position.chapterNumber}',
                                        ),
                                      ),
                                    ),
                                  );
                                },
                                loading: () => const SizedBox.shrink(),
                                error: (error, stackTrace) =>
                                    const SizedBox.shrink(),
                              ),
                              Text(
                                localizations.surahs,
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              const SizedBox(height: 12),
                              for (final chapter in items)
                                SurahListTile(
                                  chapter: chapter,
                                  onTap: () => context.go(
                                    '/quran/chapter/${chapter.chapterNumber}',
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) => _EmptyQuranState(
                  message: localizations.noCachedQuran,
                  onRetry: () => ref.invalidate(quranChaptersProvider),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _EmptyQuranState extends StatelessWidget {
  const _EmptyQuranState({
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Column(
              children: [
                Text(
                  message,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: onRetry,
                  child: Text(localizations.retry),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
