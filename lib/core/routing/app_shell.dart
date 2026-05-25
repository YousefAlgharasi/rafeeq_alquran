import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../localization/app_localizations.dart';
import '../network/connectivity_provider.dart';
import '../responsive/responsive_breakpoints.dart';
import 'app_routes.dart';

class AppShell extends ConsumerWidget {
  const AppShell({required this.child, required this.location, super.key});

  final Widget child;
  final String location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final useRail = ResponsiveBreakpoints.useNavigationRail(context);
    final selectedIndex = _selectedIndex;
    final isOnline = ref
        .watch(onlineStatusProvider)
        .maybeWhen(data: (value) => value, orElse: () => true);
    final content = Column(
      children: [
        if (!isOnline) const _OfflineIndicator(),
        Expanded(
          child: useRail
              ? Row(
                  children: [
                    NavigationRail(
                      selectedIndex: selectedIndex,
                      onDestinationSelected: (index) {
                        context.go(AppRouteDestination.values[index].path);
                      },
                      labelType: NavigationRailLabelType.all,
                      destinations: [
                        for (final destination in AppRouteDestination.values)
                          NavigationRailDestination(
                            icon: Icon(destination.icon),
                            selectedIcon: Icon(destination.selectedIcon),
                            label: Text(destination.label(localizations)),
                          ),
                      ],
                    ),
                    const VerticalDivider(width: 1),
                    Expanded(child: child),
                  ],
                )
              : child,
        ),
      ],
    );

    final scaffold = Scaffold(
      body: SafeArea(child: content),
      bottomNavigationBar: useRail
          ? null
          : NavigationBar(
              selectedIndex: selectedIndex,
              onDestinationSelected: (index) {
                context.go(AppRouteDestination.values[index].path);
              },
              destinations: [
                for (final destination in AppRouteDestination.values)
                  NavigationDestination(
                    icon: Icon(destination.icon),
                    selectedIcon: Icon(destination.selectedIcon),
                    label: destination.label(localizations),
                  ),
              ],
            ),
    );

    return Directionality(
      textDirection: localizations.textDirection,
      child: scaffold,
    );
  }

  int get _selectedIndex {
    final index = AppRouteDestination.values.indexWhere((destination) {
      if (destination.path == '/') {
        return location == '/';
      }

      return location.startsWith(destination.path);
    });

    return index < 0 ? 0 : index;
  }
}

class _OfflineIndicator extends StatelessWidget {
  const _OfflineIndicator();

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final colors = Theme.of(context).colorScheme;

    return Material(
      color: colors.surfaceContainerHighest,
      child: Tooltip(
        message: localizations.offlineModeMessage,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.cloud_off_outlined, size: 16, color: colors.primary),
              const SizedBox(width: 8),
              Flexible(
                child: Text(
                  localizations.offlineMode,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
