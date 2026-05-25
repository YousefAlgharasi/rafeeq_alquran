import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/core/localization/app_localizations.dart';
import 'package:rafeeq_alquran/core/network/connectivity_provider.dart';
import 'package:rafeeq_alquran/core/routing/app_shell.dart';
import 'package:rafeeq_alquran/core/theme/app_theme.dart';

void main() {
  testWidgets('app shell shows a compact offline indicator', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          onlineStatusProvider.overrideWith((ref) => Stream.value(false)),
        ],
        child: MaterialApp(
          locale: const Locale('en'),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          theme: AppTheme.light,
          home: const AppShell(location: '/', child: Placeholder()),
        ),
      ),
    );
    await tester.pump();
    await tester.pump();

    expect(find.text('Offline mode'), findsOneWidget);
    expect(find.byIcon(Icons.cloud_off_outlined), findsOneWidget);
  });
}
