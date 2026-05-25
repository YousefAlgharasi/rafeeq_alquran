import 'entity/reading_streak.dart';

class StreakDay {
  const StreakDay({
    required this.date,
    required this.isCompleted,
  });

  final DateTime date;
  final bool isCompleted;
}

class StreakCalculator {
  const StreakCalculator();

  ReadingStreak calculate({
    required DateTime today,
    required List<StreakDay> days,
  }) {
    final completedDates = {
      for (final day in days.where((day) => day.isCompleted)) _dateKey(day.date),
    };
    final allDates = {
      for (final day in days) _dateKey(day.date),
    };
    final normalizedToday = _dateOnly(today);

    var current = 0;
    var cursor = normalizedToday;
    while (completedDates.contains(_dateKey(cursor))) {
      current += 1;
      cursor = cursor.subtract(const Duration(days: 1));
    }

    var longest = 0;
    var running = 0;
    final sorted = completedDates.toList()..sort();
    DateTime? previous;
    for (final key in sorted) {
      final date = DateTime.parse(key);
      if (previous == null ||
          date.difference(previous).inDays == 1) {
        running += 1;
      } else {
        running = 1;
      }
      if (running > longest) {
        longest = running;
      }
      previous = date;
    }

    final missedDays = allDates.where((key) {
      return !completedDates.contains(key) &&
          !DateTime.parse(key).isAfter(normalizedToday);
    }).length;

    return ReadingStreak(
      currentStreak: current,
      longestStreak: longest,
      missedDays: missedDays,
    );
  }

  DateTime _dateOnly(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  String _dateKey(DateTime date) {
    return _dateOnly(date).toIso8601String();
  }
}
