import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../localization/app_localizations.dart';
import '../responsive/responsive_breakpoints.dart';
import 'app_routes.dart';

class AppShell extends StatelessWidget {
  const AppShell({required this.child, required this.location, super.key});

  final Widget child;
  final String location;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final useRail = ResponsiveBreakpoints.useNavigationRail(context);
    final selectedIndex = _selectedIndex;

    final scaffold = Scaffold(
      body: SafeArea(
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
