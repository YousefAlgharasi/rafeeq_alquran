import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/core/firebase/firebase_initializer.dart';
import 'package:rafeeq_alquran/core/localization/app_localizations.dart';
import 'package:rafeeq_alquran/core/theme/app_theme.dart';
import 'package:rafeeq_alquran/features/auth/ui/pages/login_page.dart';

void main() {
  testWidgets('login page renders optional guest messaging', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          firebaseInitializationProvider.overrideWith(
            (ref) async => const FirebaseInitializationResult.initialized(),
          ),
        ],
        child: MaterialApp(
          locale: const Locale('en'),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          theme: AppTheme.light,
          home: const LoginPage(),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('Login'), findsWidgets);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Continue as guest'), findsOneWidget);
    expect(
      find.text('You can use the app as a guest. Guest data stays local-only.'),
      findsOneWidget,
    );
  });
}
