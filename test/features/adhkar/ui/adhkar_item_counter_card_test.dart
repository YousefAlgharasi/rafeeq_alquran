import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/core/localization/app_localizations.dart';
import 'package:rafeeq_alquran/features/adhkar/logic/entity/adhkar_item_entity.dart';
import 'package:rafeeq_alquran/features/adhkar/logic/entity/adhkar_item_progress.dart';
import 'package:rafeeq_alquran/features/adhkar/ui/widgets/adhkar_item_counter_card.dart';
import 'package:rafeeq_alquran/features/favorites/logic/entity/favorite_entry.dart';
import 'package:rafeeq_alquran/features/favorites/logic/entity/favorite_type.dart';
import 'package:rafeeq_alquran/features/favorites/logic/entity/reading_bookmark.dart';
import 'package:rafeeq_alquran/features/favorites/logic/provider/favorites_provider.dart';
import 'package:rafeeq_alquran/features/favorites/logic/repository/favorites_repository.dart';

void main() {
  const item = AdhkarItemEntity(
    key: 'sample_item',
    categoryKey: 'morning',
    textArabic: 'نص تجريبي',
    textEnglish: 'Sample text',
    repeatCount: 3,
    source: 'verified-source-placeholder',
    sourceReference: 'sample-reference',
  );

  testWidgets('shows counter text and calls increment when tapped', (
    tester,
  ) async {
    var taps = 0;

    await tester.pumpWidget(
      _TestApp(
        child: AdhkarItemCounterCard(
          itemProgress: const AdhkarItemProgress(
            item: item,
            currentCount: 0,
            isCompleted: false,
          ),
          onIncrement: () async {
            taps++;
          },
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('0 / 3', findRichText: true), findsOneWidget);
    await tester.tap(find.bySubtype<FilledButton>());
    await tester.pump();

    expect(taps, 1);
  });

  testWidgets('disables counter in completed state', (tester) async {
    var taps = 0;

    await tester.pumpWidget(
      _TestApp(
        child: AdhkarItemCounterCard(
          itemProgress: const AdhkarItemProgress(
            item: item,
            currentCount: 3,
            isCompleted: true,
          ),
          onIncrement: () async {
            taps++;
          },
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.textContaining('3 / 3', findRichText: true), findsOneWidget);
    await tester.tap(find.bySubtype<FilledButton>(), warnIfMissed: false);
    await tester.pump();

    expect(taps, 0);
  });
}

class _TestApp extends StatelessWidget {
  const _TestApp({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        favoritesRepositoryProvider.overrideWithValue(
          _FakeFavoritesRepository(),
        ),
      ],
      child: MaterialApp(
        locale: const Locale('en'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: Scaffold(body: child),
      ),
    );
  }
}

class _FakeFavoritesRepository implements FavoritesRepository {
  @override
  Future<FavoriteEntry> addFavorite({
    required FavoriteType type,
    required String itemKey,
    String? label,
  }) async {
    return _entry(type: type, itemKey: itemKey, label: label);
  }

  @override
  Future<List<FavoriteEntry>> getFavorites({FavoriteType? type}) async {
    return const [];
  }

  @override
  Future<bool> isFavorite({
    required FavoriteType type,
    required String itemKey,
  }) async {
    return false;
  }

  @override
  Future<FavoriteEntry?> removeFavorite({
    required FavoriteType type,
    required String itemKey,
  }) async {
    return null;
  }

  @override
  Future<ReadingBookmark> saveReadingBookmark({
    required String verseKey,
    String? label,
  }) async {
    return ReadingBookmark(
      verseKey: verseKey,
      label: label,
      savedAt: DateTime(2026, 5, 25),
    );
  }

  @override
  Future<bool> toggleFavorite({
    required FavoriteType type,
    required String itemKey,
    String? label,
  }) async {
    return true;
  }
}

FavoriteEntry _entry({
  required FavoriteType type,
  required String itemKey,
  String? label,
}) {
  return FavoriteEntry(
    id: 1,
    type: type,
    itemKey: itemKey,
    label: label,
    syncStatus: 'local',
    createdAt: DateTime(2026, 5, 25),
    updatedAt: DateTime(2026, 5, 25),
  );
}
