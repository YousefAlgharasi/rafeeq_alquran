import '../entity/tafsir_entry.dart';
import '../entity/tafsir_resource.dart';

abstract class TafsirRepository {
  Future<List<TafsirResource>> getResources();

  Future<TafsirEntry> getAlMuyassarTafsir({
    required String verseKey,
    bool forceRefresh = false,
  });
}
