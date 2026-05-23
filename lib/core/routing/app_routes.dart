import 'package:flutter/material.dart';

import '../localization/app_localizations.dart';

enum AppRouteDestination {
  home('/'),
  quran('/quran'),
  dailyAyah('/daily-ayah'),
  adhkar('/adhkar'),
  prayerTimes('/prayer-times'),
  favorites('/favorites'),
  settings('/settings');

  const AppRouteDestination(this.path);

  final String path;

  String label(AppLocalizations localizations) {
    return switch (this) {
      AppRouteDestination.home => localizations.home,
      AppRouteDestination.quran => localizations.quran,
      AppRouteDestination.dailyAyah => localizations.dailyAyah,
      AppRouteDestination.adhkar => localizations.adhkar,
      AppRouteDestination.prayerTimes => localizations.prayerTimes,
      AppRouteDestination.favorites => localizations.favorites,
      AppRouteDestination.settings => localizations.settings,
    };
  }

  IconData get icon {
    return switch (this) {
      AppRouteDestination.home => Icons.home_outlined,
      AppRouteDestination.quran => Icons.menu_book_outlined,
      AppRouteDestination.dailyAyah => Icons.auto_stories_outlined,
      AppRouteDestination.adhkar => Icons.format_list_numbered_rtl_outlined,
      AppRouteDestination.prayerTimes => Icons.schedule_outlined,
      AppRouteDestination.favorites => Icons.bookmark_border_outlined,
      AppRouteDestination.settings => Icons.settings_outlined,
    };
  }

  IconData get selectedIcon {
    return switch (this) {
      AppRouteDestination.home => Icons.home,
      AppRouteDestination.quran => Icons.menu_book,
      AppRouteDestination.dailyAyah => Icons.auto_stories,
      AppRouteDestination.adhkar => Icons.format_list_numbered_rtl,
      AppRouteDestination.prayerTimes => Icons.schedule,
      AppRouteDestination.favorites => Icons.bookmark,
      AppRouteDestination.settings => Icons.settings,
    };
  }
}
