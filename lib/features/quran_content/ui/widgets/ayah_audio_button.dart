import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../logic/provider/quran_audio_playback_provider.dart';

class AyahAudioButton extends ConsumerWidget {
  const AyahAudioButton({
    required this.verseKey,
    super.key,
  });

  final String verseKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final playback = ref.watch(quranAudioPlaybackControllerProvider);
    final isCurrent = playback.currentVerseKey == verseKey;
    final isLoading = isCurrent && playback.isLoading;
    final isPlaying = isCurrent && playback.isPlaying;

    return IconButton(
      tooltip: isPlaying ? localizations.pauseRecitation : localizations.playRecitation,
      onPressed: isLoading
          ? null
          : () {
              ref
                  .read(quranAudioPlaybackControllerProvider.notifier)
                  .toggleVerse(verseKey);
            },
      icon: isLoading
          ? const SizedBox.square(
              dimension: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : Icon(isPlaying ? Icons.pause_circle_outline : Icons.play_circle_outline),
    );
  }
}
