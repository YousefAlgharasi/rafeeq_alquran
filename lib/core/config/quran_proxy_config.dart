class QuranProxyConfig {
  const QuranProxyConfig({
    required this.baseUrl,
  });

  static const defaultBaseUrl = String.fromEnvironment(
    'QURAN_PROXY_BASE_URL',
    defaultValue:
        'http://127.0.0.1:5001/demo-no-project/us-central1/quranProxy',
  );

  final String baseUrl;
}
