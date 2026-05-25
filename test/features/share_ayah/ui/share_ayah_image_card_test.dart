import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/core/localization/app_localizations.dart';
import 'package:rafeeq_alquran/core/theme/app_theme.dart';
import 'package:rafeeq_alquran/features/quran_content/logic/entity/quran_verse.dart';
import 'package:rafeeq_alquran/features/share_ayah/logic/entity/share_ayah_content.dart';
import 'package:rafeeq_alquran/features/share_ayah/ui/widgets/share_ayah_image_card.dart';
import 'package:rafeeq_alquran/features/tafsir/logic/entity/tafsir_entry.dart';
import 'package:rafeeq_alquran/features/tafsir/logic/entity/tafsir_level.dart';

void main() {
  testWidgets('share ayah image card renders ayah reference and tafsir', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _TestApp(
        child: ShareAyahImageCard(
          content: ShareAyahContent(
            surahName: 'Al-Fatihah',
            verse: _verse,
            tafsir: TafsirEntry(
              verseKey: '1:1',
              resourceId: 'verified-resource',
              resourceName: 'Al-Muyassar',
              level: TafsirLevel.alMuyassar,
              languageCode: 'ar',
              text: 'Verified tafsir placeholder',
              source: 'verified-test-source',
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Al-Fatihah'), findsOneWidget);
    expect(find.text('1:1'), findsOneWidget);
    expect(find.text('Verified placeholder ayah'), findsOneWidget);
    expect(find.text('Verified tafsir placeholder'), findsOneWidget);
  });

  testWidgets('share ayah image card skips unverified tafsir text', (
    tester,
  ) async {
    await tester.pumpWidget(
      const _TestApp(
        child: ShareAyahImageCard(
          content: ShareAyahContent(
            surahName: 'Al-Fatihah',
            verse: _verse,
            tafsir: TafsirEntry(
              verseKey: '1:1',
              resourceId: '',
              resourceName: 'Al-Muyassar',
              level: TafsirLevel.alMuyassar,
              languageCode: 'ar',
              text: 'Unverified tafsir placeholder',
              source: '',
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Unverified tafsir placeholder'), findsNothing);
  });
}

const _verse = QuranVerse(
  verseKey: '1:1',
  chapterNumber: 1,
  verseNumber: 1,
  source: 'verified-test-source',
  textArabic: 'Verified placeholder ayah',
);

class _TestApp extends StatelessWidget {
  const _TestApp({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('en'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: AppTheme.light,
      home: Scaffold(body: Center(child: child)),
    );
  }
}
