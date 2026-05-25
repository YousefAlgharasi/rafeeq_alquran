class AdhkarItemEntity {
  const AdhkarItemEntity({
    required this.key,
    required this.categoryKey,
    required this.textArabic,
    required this.textEnglish,
    required this.repeatCount,
    required this.source,
    required this.sourceReference,
  });

  final String key;
  final String categoryKey;
  final String textArabic;
  final String? textEnglish;
  final int repeatCount;
  final String source;
  final String sourceReference;
}
