import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/core/localization/app_localizations.dart';
import 'package:rafeeq_alquran/core/theme/app_theme.dart';
import 'package:rafeeq_alquran/features/tafsir/logic/entity/tafsir_entry.dart';
import 'package:rafeeq_alquran/features/tafsir/logic/entity/tafsir_level.dart';
import 'package:rafeeq_alquran/features/tafsir/logic/entity/tafsir_resource.dart';
import 'package:rafeeq_alquran/features/tafsir/logic/provider/tafsir_provider.dart';
import 'package:rafeeq_alquran/features/tafsir/logic/repository/tafsir_repository.dart';
import 'package:rafeeq_alquran/features/tafsir/ui/widgets/ayah_tafsir_panel.dart';

void main() {
  testWidgets('shows Al-Muyassar and disables unavailable levels', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          tafsirRepositoryProvider.overrideWithValue(_FakeTafsirRepository()),
        ],
        child: MaterialApp(
          locale: const Locale('en'),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          theme: AppTheme.light,
          home: const Scaffold(
            body: AyahTafsirPanel(verseKey: '1:1'),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();
    await tester.tap(find.text('Tafsir'));
    await tester.pumpAndSettle();

    expect(find.text('Short meaning · Coming soon'), findsOneWidget);
    expect(find.text('Al-Muyassar'), findsOneWidget);
    expect(find.text('Full tafsir · Coming soon'), findsOneWidget);
    expect(find.text('Verified tafsir placeholder'), findsOneWidget);
  });
}

class _FakeTafsirRepository implements TafsirRepository {
  @override
  Future<TafsirEntry> getAlMuyassarTafsir({
    required String verseKey,
    bool forceRefresh = false,
  }) async {
    return TafsirEntry(
      verseKey: verseKey,
      resourceId: 'muyassar',
      resourceName: 'Al-Muyassar',
      level: TafsirLevel.alMuyassar,
      languageCode: 'ar',
      text: 'Verified tafsir placeholder',
      source: 'verified-test-source',
    );
  }

  @override
  Future<List<TafsirResource>> getResources() async {
    return const [
      TafsirResource(
        id: 'short-unavailable',
        name: 'Short meaning',
        level: TafsirLevel.shortMeaning,
        isAvailable: false,
        source: 'unavailable',
      ),
      TafsirResource(
        id: 'muyassar',
        name: 'Al-Muyassar',
        level: TafsirLevel.alMuyassar,
        isAvailable: true,
        source: 'verified-test-source',
      ),
      TafsirResource(
        id: 'full-unavailable',
        name: 'Full tafsir',
        level: TafsirLevel.full,
        isAvailable: false,
        source: 'unavailable',
      ),
    ];
  }
}
