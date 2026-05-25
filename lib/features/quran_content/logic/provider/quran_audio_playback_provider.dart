import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

import '../entity/quran_audio_metadata.dart';
import 'quran_content_provider.dart';

class QuranAudioPlaybackState {
  const QuranAudioPlaybackState({
    this.currentVerseKey,
    this.isPlaying = false,
    this.isLoading = false,
  });

  final String? currentVerseKey;
  final bool isPlaying;
  final bool isLoading;

  QuranAudioPlaybackState copyWith({
    String? currentVerseKey,
    bool? isPlaying,
    bool? isLoading,
  }) {
    return QuranAudioPlaybackState(
      currentVerseKey: currentVerseKey ?? this.currentVerseKey,
      isPlaying: isPlaying ?? this.isPlaying,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

abstract class QuranAudioPlaybackService {
  Future<void> play(String url);

  Future<void> pause();

  Future<void> dispose();
}

class JustAudioQuranAudioPlaybackService implements QuranAudioPlaybackService {
  JustAudioQuranAudioPlaybackService({AudioPlayer? player})
      : _player = player ?? AudioPlayer();

  final AudioPlayer _player;

  @override
  Future<void> play(String url) async {
    await _player.setUrl(url);
    await _player.play();
  }

  @override
  Future<void> pause() {
    return _player.pause();
  }

  @override
  Future<void> dispose() {
    return _player.dispose();
  }
}

final quranAudioPlaybackServiceProvider =
    Provider<QuranAudioPlaybackService>((ref) {
  final service = JustAudioQuranAudioPlaybackService();
  ref.onDispose(service.dispose);
  return service;
});

final quranAudioPlaybackControllerProvider =
    NotifierProvider<QuranAudioPlaybackController, QuranAudioPlaybackState>(
      QuranAudioPlaybackController.new,
    );

class QuranAudioPlaybackController extends Notifier<QuranAudioPlaybackState> {
  @override
  QuranAudioPlaybackState build() {
    return const QuranAudioPlaybackState();
  }

  Future<void> toggleVerse(String verseKey) async {
    try {
      if (state.currentVerseKey == verseKey && state.isPlaying) {
        await ref.read(quranAudioPlaybackServiceProvider).pause();
        state = state.copyWith(isPlaying: false, isLoading: false);
        return;
      }

      state = QuranAudioPlaybackState(
        currentVerseKey: verseKey,
        isLoading: true,
      );

      final repository = ref.read(quranContentRepositoryProvider);
      final reciters = await repository.getReciters();
      if (reciters.isEmpty) {
        state = QuranAudioPlaybackState(currentVerseKey: verseKey);
        return;
      }

      final metadata = await repository.getRecitationMetadata(
        reciterId: reciters.first.id,
        verseKey: verseKey,
      );
      final audio = _firstPlayable(metadata);
      if (audio == null) {
        state = QuranAudioPlaybackState(currentVerseKey: verseKey);
        return;
      }

      await ref.read(quranAudioPlaybackServiceProvider).play(audio);
      state = QuranAudioPlaybackState(
        currentVerseKey: verseKey,
        isPlaying: true,
      );
    } catch (_) {
      state = QuranAudioPlaybackState(currentVerseKey: verseKey);
    }
  }

  String? _firstPlayable(List<QuranAudioMetadata> metadata) {
    for (final item in metadata) {
      final playable = item.playableUrl;
      if (playable != null && playable.isNotEmpty) {
        return playable;
      }
    }
    return null;
  }
}
