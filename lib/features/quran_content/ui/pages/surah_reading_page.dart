import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/responsive/responsive_breakpoints.dart';
import '../../../reading_tracker/logic/entity/reading_session.dart';
import '../../../reading_tracker/logic/provider/reading_tracker_provider.dart';
import '../../logic/entity/reading_position.dart';
import '../../logic/provider/quran_content_provider.dart';
import '../widgets/ayah_card.dart';

class SurahReadingPage extends ConsumerWidget {
  const SurahReadingPage({
    required this.chapterNumber,
    super.key,
  });

  final int chapterNumber;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final verses = ref.watch(quranChapterVersesProvider(chapterNumber));

    return Scaffold(
      appBar: AppBar(
        title: Text('${localizations.quran} $chapterNumber'),
      ),
      body: SafeArea(
        top: false,
        child: verses.when(
          data: (items) {
            if (items.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(localizations.noCachedQuran),
                ),
              );
            }

            return LayoutBuilder(
              builder: (context, constraints) {
                return ListView.separated(
                  padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth >=
                            ResponsiveBreakpoints.wideNavigation
                        ? 32
                        : 16,
                    vertical: 16,
                  ),
                  itemBuilder: (context, index) {
                    final verse = items[index];
                    return Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: ResponsiveBreakpoints.maxContentWidth,
                        ),
                        child: AyahCard(
                          verse: verse,
                          onVisible: () {
                            ref
                                .read(quranContentRepositoryProvider)
                                .saveLastReadPosition(
                                  ReadingPosition(
                                    verseKey: verse.verseKey,
                                    chapterNumber: verse.chapterNumber,
                                    verseNumber: verse.verseNumber,
                                    lastReadAt: DateTime.now().toUtc(),
                                  ),
                                );
                            ref
                                .read(readingTrackerRepositoryProvider)
                                .recordSession(
                                  ReadingSession(
                                    sessionDate: DateTime.now(),
                                    startedAt: DateTime.now().toUtc(),
                                    endedAt: DateTime.now().toUtc(),
                                    ayahCount: 1,
                                    pageCount: verse.verseNumber == 1 ? 1 : 0,
                                    durationMinutes: 1,
                                    startVerseKey: verse.verseKey,
                                    endVerseKey: verse.verseKey,
                                  ),
                                );
                          },
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 12,
                  ),
                  itemCount: items.length,
                );
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Text(localizations.noCachedQuran),
            ),
          ),
        ),
      ),
    );
  }
}
