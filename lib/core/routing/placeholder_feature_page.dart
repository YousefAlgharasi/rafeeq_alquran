import 'package:flutter/material.dart';

import '../localization/app_localizations.dart';
import '../responsive/responsive_breakpoints.dart';

class PlaceholderFeaturePage extends StatelessWidget {
  const PlaceholderFeaturePage({required this.titleBuilder, super.key});

  final String Function(AppLocalizations localizations) titleBuilder;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(titleBuilder(localizations))),
      body: SafeArea(
        top: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal:
                    constraints.maxWidth >= ResponsiveBreakpoints.wideNavigation
                    ? 32
                    : 20,
                vertical: 24,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: ResponsiveBreakpoints.maxContentWidth,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        localizations.scaffoldReady,
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        titleBuilder(localizations),
                        style: theme.textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        localizations.placeholderBody,
                        style: theme.textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
