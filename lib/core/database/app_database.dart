import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

mixin TimestampColumns on Table {
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();
}

mixin SoftDeleteColumn on Table {
  DateTimeColumn get deletedAt => dateTime().nullable()();
}

mixin SyncColumns on Table {
  TextColumn get firebaseId => text().nullable()();
  TextColumn get ownerUserId => text().nullable()();
  TextColumn get syncStatus => text().withDefault(const Constant('local'))();
}

class UserProfileCaches extends Table
    with TimestampColumns, SoftDeleteColumn, SyncColumns {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get displayName => text().nullable()();
  TextColumn get email => text().nullable()();
  TextColumn get preferredLanguage =>
      text().withDefault(const Constant('ar'))();
}

class QuranChaptersCache extends Table with TimestampColumns {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get chapterNumber => integer().unique()();
  TextColumn get nameArabic => text()();
  TextColumn get nameEnglish => text().nullable()();
  IntColumn get versesCount => integer()();
  TextColumn get source => text()();
}

class QuranVersesCache extends Table with TimestampColumns {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get chapterNumber => integer()();
  IntColumn get verseNumber => integer()();
  TextColumn get verseKey => text().unique()();
  TextColumn get textArabic => text()();
  TextColumn get translationText => text().nullable()();
  TextColumn get translationSource => text().nullable()();
  TextColumn get source => text()();
}

class TafsirCaches extends Table with TimestampColumns {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get verseKey => text()();
  TextColumn get tafsirId => text()();
  TextColumn get languageCode => text()();
  TextColumn get tafsirText => text()();
  TextColumn get source => text()();
}

class AudioCacheMetadata extends Table with TimestampColumns {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get verseKey => text().nullable()();
  TextColumn get reciterId => text()();
  TextColumn get remoteUrl => text()();
  TextColumn get localPath => text().nullable()();
  TextColumn get source => text()();
  BoolColumn get isDownloaded => boolean().withDefault(const Constant(false))();
}

class QuranRecitersCache extends Table with TimestampColumns {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get reciterId => text().unique()();
  TextColumn get nameArabic => text().nullable()();
  TextColumn get nameEnglish => text().nullable()();
  TextColumn get style => text().nullable()();
  TextColumn get source => text()();
}

class DailyAyahHistory extends Table
    with TimestampColumns, SoftDeleteColumn, SyncColumns {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get verseKey => text()();
  DateTimeColumn get selectedDate => dateTime()();
  BoolColumn get wasRead => boolean().withDefault(const Constant(false))();
}

class ReadingProgress extends Table
    with TimestampColumns, SoftDeleteColumn, SyncColumns {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get verseKey => text()();
  IntColumn get chapterNumber => integer()();
  IntColumn get verseNumber => integer()();
  DateTimeColumn get lastReadAt => dateTime().nullable()();
}

class ReadingSessions extends Table
    with TimestampColumns, SoftDeleteColumn, SyncColumns {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get sessionDate => dateTime()();
  DateTimeColumn get startedAt => dateTime()();
  DateTimeColumn get endedAt => dateTime().nullable()();
  IntColumn get ayahCount => integer().withDefault(const Constant(0))();
  IntColumn get pageCount => integer().withDefault(const Constant(0))();
  IntColumn get durationMinutes => integer().withDefault(const Constant(0))();
  TextColumn get startVerseKey => text().nullable()();
  TextColumn get endVerseKey => text().nullable()();
}

class DailyGoals extends Table
    with TimestampColumns, SoftDeleteColumn, SyncColumns {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get goalDate => dateTime()();
  TextColumn get goalType =>
      text().withDefault(const Constant('one_ayah_per_day'))();
  IntColumn get targetVerses => integer().withDefault(const Constant(0))();
  IntColumn get completedVerses => integer().withDefault(const Constant(0))();
  IntColumn get targetPages => integer().withDefault(const Constant(0))();
  IntColumn get completedPages => integer().withDefault(const Constant(0))();
  IntColumn get targetMinutes => integer().withDefault(const Constant(0))();
  IntColumn get completedMinutes => integer().withDefault(const Constant(0))();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
}

class StreakRecords extends Table
    with TimestampColumns, SoftDeleteColumn, SyncColumns {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get streakDate => dateTime()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  BoolColumn get isMissed => boolean().withDefault(const Constant(false))();
}

class ReflectionNotes extends Table
    with TimestampColumns, SoftDeleteColumn, SyncColumns {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get verseKey => text().nullable()();
  TextColumn get sourceType =>
      text().withDefault(const Constant('quran_ayah'))();
  TextColumn get title => text().nullable()();
  TextColumn get body => text()();
}

class FavoriteBookmarks extends Table
    with TimestampColumns, SoftDeleteColumn, SyncColumns {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get itemType => text()();
  TextColumn get itemKey => text()();
  TextColumn get label => text().nullable()();
}

class AdhkarCategories extends Table with TimestampColumns {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get categoryKey => text().unique()();
  TextColumn get titleArabic => text()();
  TextColumn get titleEnglish => text().nullable()();
  TextColumn get source => text()();
}

class AdhkarItems extends Table with TimestampColumns {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get itemKey => text().unique()();
  TextColumn get categoryKey => text()();
  TextColumn get textArabic => text()();
  TextColumn get textEnglish => text().nullable()();
  IntColumn get repeatCount => integer().withDefault(const Constant(1))();
  TextColumn get source => text()();
  TextColumn get sourceReference => text()();
}

class AdhkarProgressCounters extends Table
    with TimestampColumns, SoftDeleteColumn, SyncColumns {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get itemKey => text()();
  DateTimeColumn get progressDate => dateTime()();
  IntColumn get currentCount => integer().withDefault(const Constant(0))();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
}

class PrayerTimesCache extends Table with TimestampColumns {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get prayerDate => dateTime()();
  TextColumn get locationKey => text()();
  TextColumn get calculationMethod => text().nullable()();
  TextColumn get madhab => text().nullable()();
  TextColumn get timingsJson => text()();
  TextColumn get source => text()();
}

class NotificationSchedules extends Table
    with TimestampColumns, SoftDeleteColumn, SyncColumns {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get notificationKey => text()();
  TextColumn get notificationType => text()();
  DateTimeColumn get scheduledAt => dateTime()();
  BoolColumn get isEnabled => boolean().withDefault(const Constant(true))();
  TextColumn get payloadJson => text().nullable()();
}

class AppSettings extends Table with TimestampColumns, SyncColumns {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get settingKey => text()();
  TextColumn get settingValue => text()();
  TextColumn get valueType => text().withDefault(const Constant('string'))();
}

class SyncQueue extends Table with TimestampColumns {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get ownerUserId => text().nullable()();
  TextColumn get entityType => text()();
  IntColumn get localEntityId => integer()();
  TextColumn get operation => text()();
  TextColumn get payloadJson => text()();
  TextColumn get status => text().withDefault(const Constant('pending'))();
  IntColumn get retryCount => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastAttemptAt => dateTime().nullable()();
}

class SyncMetadata extends Table with TimestampColumns {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get ownerUserId => text().nullable()();
  TextColumn get entityType => text()();
  DateTimeColumn get lastSyncedAt => dateTime().nullable()();
  TextColumn get lastSyncToken => text().nullable()();
  TextColumn get status => text().withDefault(const Constant('idle'))();
}

@DriftDatabase(
  tables: [
    UserProfileCaches,
    QuranChaptersCache,
    QuranVersesCache,
    TafsirCaches,
    AudioCacheMetadata,
    QuranRecitersCache,
    DailyAyahHistory,
    ReadingProgress,
    ReadingSessions,
    DailyGoals,
    StreakRecords,
    ReflectionNotes,
    FavoriteBookmarks,
    AdhkarCategories,
    AdhkarItems,
    AdhkarProgressCounters,
    PrayerTimesCache,
    NotificationSchedules,
    AppSettings,
    SyncQueue,
    SyncMetadata,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  AppDatabase.forTesting(super.executor);

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final file = File(p.join(documentsDirectory.path, 'rafeeq_alquran.sqlite'));

    return NativeDatabase.createInBackground(file);
  });
}
