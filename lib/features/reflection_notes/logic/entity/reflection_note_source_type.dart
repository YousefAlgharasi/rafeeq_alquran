enum ReflectionNoteSourceType {
  quranAyah('quran_ayah'),
  dailyAyah('daily_ayah');

  const ReflectionNoteSourceType(this.value);

  final String value;

  static ReflectionNoteSourceType fromValue(String value) {
    return ReflectionNoteSourceType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => ReflectionNoteSourceType.quranAyah,
    );
  }
}
