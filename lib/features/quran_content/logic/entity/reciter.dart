class Reciter {
  const Reciter({
    required this.id,
    required this.source,
    this.nameArabic,
    this.nameEnglish,
    this.style,
  });

  final String id;
  final String source;
  final String? nameArabic;
  final String? nameEnglish;
  final String? style;
}
