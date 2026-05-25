enum ReadingGoalType {
  oneAyahPerDay('one_ayah_per_day'),
  fiveAyahsPerDay('five_ayahs_per_day'),
  onePagePerDay('one_page_per_day'),
  tenMinutesPerDay('ten_minutes_per_day');

  const ReadingGoalType(this.storageValue);

  final String storageValue;

  static ReadingGoalType fromStorageValue(String value) {
    return ReadingGoalType.values.firstWhere(
      (type) => type.storageValue == value,
      orElse: () => ReadingGoalType.oneAyahPerDay,
    );
  }

  int get targetVerses {
    return switch (this) {
      ReadingGoalType.oneAyahPerDay => 1,
      ReadingGoalType.fiveAyahsPerDay => 5,
      ReadingGoalType.onePagePerDay => 0,
      ReadingGoalType.tenMinutesPerDay => 0,
    };
  }

  int get targetPages {
    return this == ReadingGoalType.onePagePerDay ? 1 : 0;
  }

  int get targetMinutes {
    return this == ReadingGoalType.tenMinutesPerDay ? 10 : 0;
  }
}
