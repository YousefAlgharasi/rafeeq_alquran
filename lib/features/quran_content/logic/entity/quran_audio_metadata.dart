class QuranAudioMetadata {
  const QuranAudioMetadata({
    required this.reciterId,
    required this.source,
    this.verseKey,
    this.remoteUrl,
  });

  final String reciterId;
  final String source;
  final String? verseKey;
  final String? remoteUrl;
}
