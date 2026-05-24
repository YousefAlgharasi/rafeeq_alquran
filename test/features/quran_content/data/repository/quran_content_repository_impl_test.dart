import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/features/quran_content/data/datasources/quran_content_datasource.dart';
import 'package:rafeeq_alquran/features/quran_content/data/datasources/quran_local_datasource.dart';
import 'package:rafeeq_alquran/features/quran_content/data/repository/repo_impl/quran_content_repository_impl.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/quran_audio_metadata.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/quran_chapter.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/quran_tafsir.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/quran_verse.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/reading_position.dart';

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
        cachedChapters: const [
          QuranChapter(
            chapterNumber: 1,
            versesCount: 7,
            source: 'cache',
            nameEnglish: 'Cached',
          ),
        ],
      ),
    );

    final chapters = await repository.getChapters();

    expect(chapters.single.chapterNumber, 1);
    expect(chapters.single.source, 'cache');
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
}

class _FakeRemoteDatasource implements QuranContentRemoteDatasource {
  _FakeRemoteDatasource({
    this.chapters = const [],
  });

  final List<QuranChapter> chapters;

  @override
  Future<List<QuranChapter>> getChapters() async => chapters;

  @override
  Future<List<QuranVerse>> getVersesByChapter(int chapterNumber) async {
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
}

class _FakeLocalDatasource implements QuranContentLocalDatasource {
  _FakeLocalDatasource({
    this.cachedChapters = const [],
  });

  List<QuranChapter> cachedChapters;
  List<QuranVerse> cachedVerses = const [];
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
  Future<List<QuranChapter>> getCachedChapters() async => cachedChapters;

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
