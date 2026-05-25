import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/firebase/firebase_initializer.dart';
import 'core/localization/app_localizations.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/settings/logic/provider/settings_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();
  runApp(const RafeqAlQuranApp());
}

class RafeqAlQuranApp extends StatelessWidget {
  const RafeqAlQuranApp({super.key, this.locale});

  final Locale? locale;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(child: _RafeqAlQuranApp(locale: locale));
  }
}

class _RafeqAlQuranApp extends ConsumerWidget {
  const _RafeqAlQuranApp({this.locale});

  final Locale? locale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final persistedLocale = ref.watch(appLanguageProvider).value?.locale;

    return MaterialApp.router(
      title: 'Rafeeq Al Quran',
      debugShowCheckedModeBanner: false,
      locale: locale ?? persistedLocale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: AppTheme.light,
      routerConfig: appRouter,
    );
  }
}
