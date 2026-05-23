import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: RafeqAlQuranApp()));
}

class RafeqAlQuranApp extends StatelessWidget {
  const RafeqAlQuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rafeeq Al Quran',
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2E7D62)),
        useMaterial3: true,
      ),
      home: const BootstrapPlaceholderPage(),
    );
  }
}

class BootstrapPlaceholderPage extends StatelessWidget {
  const BootstrapPlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('رفيق القرآن'),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final horizontalPadding = constraints.maxWidth >= 600 ? 32.0 : 20.0;

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: 24,
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'رفيق القرآن',
                      style: textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Bootstrap complete. Feature UI starts in later tasks.',
                      style: textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
