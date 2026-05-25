import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/features/quran_content/data/datasources/quran_content_datasource.dart';
import 'package:rafeeq_alquran/features/quran_content/data/datasources/quran_local_datasource.dart';
import 'package:rafeeq_alquran/features/quran_content/data/repository/repo_impl/quran_content_repository_impl.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/quran_audio_metadata.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/quran_chapter.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/quran_tafsir.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/quran_verse.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/reading_position.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/reciter.dart';

void main() {
  test('returns cached chapters before remote fetch', () async {
    final repository = QuranContentRepositoryImpl(
      remoteDatasource: _FakeRemoteDatasource(
        chapters: const [
          QuranChapter(
            chapterNumber: 2,
            versesCount: 286,
            source: 'remote',
            nameEnglish: 'Remote',
          ),
        ],
      ),
      localDatasource: _FakeLocalDatasource(
        cachedChapters: _completeCachedChapters(),
      ),
    );

    final chapters = await repository.getChapters();

    expect(chapters, hasLength(114));
    expect(chapters.first.source, 'cache');
  });

  test('refreshes chapters when local cache is partial', () async {
    final local = _FakeLocalDatasource(
      cachedChapters: const [
        QuranChapter(
          chapterNumber: 1,
          versesCount: 7,
          source: 'old-cache',
          nameEnglish: 'Al-Fatihah',
        ),
        QuranChapter(
          chapterNumber: 2,
          versesCount: 286,
          source: 'old-cache',
          nameEnglish: 'Al-Baqarah',
        ),
      ],
    );
    final repository = QuranContentRepositoryImpl(
      remoteDatasource: _FakeRemoteDatasource(
        chapters: _completeRemoteChapters(),
      ),
      localDatasource: local,
    );

    final chapters = await repository.getChapters();

    expect(chapters, hasLength(114));
    expect(chapters.first.source, 'remote');
    expect(local.cachedChapters, hasLength(114));
  });

  test('caches remote chapters when cache is empty', () async {
    final local = _FakeLocalDatasource();
    final repository = QuranContentRepositoryImpl(
      remoteDatasource: _FakeRemoteDatasource(
        chapters: const [
          QuranChapter(
            chapterNumber: 1,
            versesCount: 7,
            source: 'remote',
            nameEnglish: 'Remote',
          ),
        ],
      ),
      localDatasource: local,
    );

    final chapters = await repository.getChapters();

    expect(chapters.single.source, 'remote');
    expect(local.cachedChapters.single.source, 'remote');
  });

  test('returns cached verses when refresh fails offline', () async {
    final repository = QuranContentRepositoryImpl(
      remoteDatasource: _FakeRemoteDatasource(throwOnVerses: true),
      localDatasource: _FakeLocalDatasource(
        cachedVerses: const [
          QuranVerse(
            verseKey: '1:1',
            chapterNumber: 1,
            verseNumber: 1,
            textArabic: 'Cached verified ayah',
            source: 'cache',
          ),
        ],
      ),
    );

    final verses = await repository.getVersesByChapter(1, forceRefresh: true);

    expect(verses.single.textArabic, 'Cached verified ayah');
    expect(verses.single.source, 'cache');
  });
}

List<QuranChapter> _completeCachedChapters() {
  return List.generate(
    114,
    (index) => QuranChapter(
      chapterNumber: index + 1,
      versesCount: index == 0 ? 7 : 3,
      source: 'cache',
      nameEnglish: 'Cached ${index + 1}',
    ),
  );
}

List<QuranChapter> _completeRemoteChapters() {
  return List.generate(
    114,
    (index) => QuranChapter(
      chapterNumber: index + 1,
      versesCount: index == 0 ? 7 : 3,
      source: 'remote',
      nameEnglish: 'Remote ${index + 1}',
    ),
  );
}

class _FakeRemoteDatasource implements QuranContentRemoteDatasource {
  _FakeRemoteDatasource({this.chapters = const [], this.throwOnVerses = false});

  final List<QuranChapter> chapters;
  final bool throwOnVerses;

  @override
  Future<List<QuranChapter>> getChapters() async => chapters;

  @override
  Future<List<QuranVerse>> getVersesByChapter(int chapterNumber) async {
    if (throwOnVerses) {
      throw StateError('offline');
    }
    return const [];
  }

  @override
  Future<List<QuranVerse>> getVersesByJuz(int juzNumber) async => const [];

  @override
  Future<List<QuranVerse>> getVersesByPage(int pageNumber) async => const [];

  @override
  Future<List<QuranAudioMetadata>> getRecitationMetadata({
    required String reciterId,
    String? verseKey,
  }) async {
    return const [];
  }

  @override
  Future<QuranTafsir> getTafsir({
    required String verseKey,
    required String resourceId,
  }) async {
    return QuranTafsir(
      verseKey: verseKey,
      resourceId: resourceId,
      languageCode: 'ar',
      source: 'fake',
    );
  }

  @override
  Future<List<Reciter>> getReciters() async {
    return const [];
  }
}

class _FakeLocalDatasource implements QuranContentLocalDatasource {
  _FakeLocalDatasource({
    this.cachedChapters = const [],
    this.cachedVerses = const [],
  });

  List<QuranChapter> cachedChapters;
  List<QuranVerse> cachedVerses;
  List<Reciter> cachedReciters = const [];
  List<QuranAudioMetadata> cachedAudioMetadata = const [];
  ReadingPosition? position;

  @override
  Future<void> cacheChapters(List<QuranChapter> chapters) async {
    cachedChapters = chapters;
  }

  @override
  Future<void> cacheVerses(List<QuranVerse> verses) async {
    cachedVerses = verses;
  }

  @override
  Future<void> cacheReciters(List<Reciter> reciters) async {
    cachedReciters = reciters;
  }

  @override
  Future<void> cacheRecitationMetadata(
    List<QuranAudioMetadata> metadata,
  ) async {
    cachedAudioMetadata = metadata;
  }

  @override
  Future<List<QuranChapter>> getCachedChapters() async => cachedChapters;

  @override
  Future<List<Reciter>> getCachedReciters() async => cachedReciters;

  @override
  Future<List<QuranAudioMetadata>> getCachedRecitationMetadata({
    required String reciterId,
    String? verseKey,
  }) async {
    return cachedAudioMetadata;
  }

  @override
  Future<List<QuranVerse>> getCachedVersesByChapter(int chapterNumber) async {
    return cachedVerses;
  }

  @override
  Future<ReadingPosition?> getLastReadPosition() async => position;

  @override
  Future<void> saveLastReadPosition(ReadingPosition position) async {
    this.position = position;
  }
}
