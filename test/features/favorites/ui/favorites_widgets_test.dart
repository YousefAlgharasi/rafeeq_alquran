import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/core/localization/app_localizations.dart';
import 'package:rafeeq_alquran/core/theme/app_theme.dart';
import 'package:rafeeq_alquran/features/favorites/logic/entity/favorite_entry.dart';
import 'package:rafeeq_alquran/features/favorites/logic/entity/favorite_type.dart';
import 'package:rafeeq_alquran/features/favorites/logic/entity/reading_bookmark.dart';
import 'package:rafeeq_alquran/features/favorites/logic/provider/favorites_provider.dart';
import 'package:rafeeq_alquran/features/favorites/logic/repository/favorites_repository.dart';
import 'package:rafeeq_alquran/features/favorites/ui/pages/favorites_page.dart';
import 'package:rafeeq_alquran/features/favorites/ui/widgets/favorite_button.dart';

void main() {
  testWidgets('favorite button toggles saved state', (tester) async {
    final repository = _FakeFavoritesRepository();

    await tester.pumpWidget(
      _TestApp(
        repository: repository,
        child: const Scaffold(
          body: FavoriteButton(
            type: FavoriteType.ayah,
            itemKey: '1:1',
            label: '1:1',
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.favorite_border), findsOneWidget);

    await tester.tap(find.byType(FavoriteButton));
    await tester.pumpAndSettle();

    expect(repository.isSaved(FavoriteType.ayah, '1:1'), isTrue);
    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });

  testWidgets('favorites page filters by type', (tester) async {
    final repository = _FakeFavoritesRepository(
      entries: [
        _entry(id: 1, type: FavoriteType.ayah, itemKey: '1:1'),
        _entry(id: 2, type: FavoriteType.adhkar, itemKey: 'morning-1'),
      ],
    );

    await tester.pumpWidget(
      _TestApp(repository: repository, child: const FavoritesPage()),
    );
    await tester.pumpAndSettle();

    expect(find.text('1:1'), findsWidgets);
    expect(find.text('morning-1'), findsWidgets);

    await tester.tap(find.text('Adhkar'));
    await tester.pumpAndSettle();

    expect(find.text('morning-1'), findsWidgets);
    expect(find.text('Ayah  1:1'), findsNothing);
  });
}

class _TestApp extends StatelessWidget {
  const _TestApp({required this.repository, required this.child});

  final FavoritesRepository repository;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [favoritesRepositoryProvider.overrideWithValue(repository)],
      child: MaterialApp(
        locale: const Locale('en'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        theme: AppTheme.light,
        home: child,
      ),
    );
  }
}

class _FakeFavoritesRepository implements FavoritesRepository {
  _FakeFavoritesRepository({List<FavoriteEntry> entries = const []})
    : _entries = [...entries];

  final List<FavoriteEntry> _entries;

  bool isSaved(FavoriteType type, String itemKey) {
    return _entries.any(
      (entry) => entry.type == type && entry.itemKey == itemKey,
    );
  }

  @override
  Future<FavoriteEntry> addFavorite({
    required FavoriteType type,
    required String itemKey,
    String? label,
  }) async {
    final entry = _entry(
      id: _entries.length + 1,
      type: type,
      itemKey: itemKey,
      label: label,
    );
    _entries.add(entry);
    return entry;
  }

  @override
  Future<List<FavoriteEntry>> getFavorites({FavoriteType? type}) async {
    return _entries
        .where((entry) => type == null || entry.type == type)
        .toList();
  }

  @override
  Future<bool> isFavorite({
    required FavoriteType type,
    required String itemKey,
  }) async {
    return isSaved(type, itemKey);
  }

  @override
  Future<FavoriteEntry?> removeFavorite({
    required FavoriteType type,
    required String itemKey,
  }) async {
    final index = _entries.indexWhere(
      (entry) => entry.type == type && entry.itemKey == itemKey,
    );
    if (index == -1) {
      return null;
    }
    return _entries.removeAt(index);
  }

  @override
  Future<ReadingBookmark> saveReadingBookmark({
    required String verseKey,
    String? label,
  }) async {
    await addFavorite(
      type: FavoriteType.readingBookmark,
      itemKey: verseKey,
      label: label,
    );
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
    if (await isFavorite(type: type, itemKey: itemKey)) {
      await removeFavorite(type: type, itemKey: itemKey);
      return false;
    }
    await addFavorite(type: type, itemKey: itemKey, label: label);
    return true;
  }
}

FavoriteEntry _entry({
  required int id,
  required FavoriteType type,
  required String itemKey,
  String? label,
}) {
  return FavoriteEntry(
    id: id,
    type: type,
    itemKey: itemKey,
    label: label,
    syncStatus: 'local',
    createdAt: DateTime(2026, 5, 25),
    updatedAt: DateTime(2026, 5, 25),
  );
}
