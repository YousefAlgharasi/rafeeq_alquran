import 'package:go_router/go_router.dart';

import '../../features/adhkar/ui/pages/adhkar_list_page.dart';
import '../../features/adhkar/ui/pages/adhkar_page.dart';
import '../../features/auth/ui/pages/login_page.dart';
import '../../features/auth/ui/pages/profile_page.dart';
import '../../features/daily_ayah/ui/pages/daily_ayah_page.dart';
import '../../features/favorites/ui/pages/favorites_page.dart';
import '../../features/home/ui/pages/home_page.dart';
import '../../features/prayer_times/ui/pages/prayer_times_page.dart';
import '../../features/quran_content/ui/pages/quran_page.dart';
import '../../features/quran_content/ui/pages/surah_reading_page.dart';
import '../../features/settings/ui/pages/settings_page.dart';
import 'app_routes.dart';
import 'app_shell.dart';

final appRouter = GoRouter(
  initialLocation: AppRouteDestination.home.path,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return AppShell(location: state.uri.path, child: child);
      },
      routes: [
        GoRoute(
          path: AppRouteDestination.home.path,
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: AppRouteDestination.quran.path,
          builder: (context, state) => const QuranPage(),
        ),
        GoRoute(
          path: '/quran/chapter/:chapterNumber',
          builder: (context, state) {
            final chapterNumber =
                int.tryParse(state.pathParameters['chapterNumber'] ?? '') ?? 1;
            return SurahReadingPage(chapterNumber: chapterNumber);
          },
        ),
        GoRoute(
          path: AppRouteDestination.dailyAyah.path,
          builder: (context, state) => const DailyAyahPage(),
        ),
        GoRoute(
          path: AppRouteDestination.adhkar.path,
          builder: (context, state) => const AdhkarPage(),
        ),
        GoRoute(
          path: '/adhkar/:categoryKey',
          builder: (context, state) {
            return AdhkarListPage(
              categoryKey: state.pathParameters['categoryKey'] ?? '',
            );
          },
        ),
        GoRoute(
          path: AppRouteDestination.prayerTimes.path,
          builder: (context, state) => const PrayerTimesPage(),
        ),
        GoRoute(
          path: AppRouteDestination.favorites.path,
          builder: (context, state) => const FavoritesPage(),
        ),
        GoRoute(
          path: AppRouteDestination.settings.path,
          builder: (context, state) => const SettingsPage(),
        ),
        GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfilePage(),
        ),
      ],
    ),
  ],
);
