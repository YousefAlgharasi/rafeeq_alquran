class QuranAudioMetadata {
  const QuranAudioMetadata({
    required this.reciterId,
    required this.source,
    this.verseKey,
    this.remoteUrl,
    this.localPath,
    this.isDownloaded = false,
  });

  final String reciterId;
  final String source;
  final String? verseKey;
  final String? remoteUrl;
  final String? localPath;
  final bool isDownloaded;

  String? get playableUrl {
    if (isDownloaded && localPath != null && localPath!.isNotEmpty) {
      return localPath;
    }
    return remoteUrl;
  }
}
