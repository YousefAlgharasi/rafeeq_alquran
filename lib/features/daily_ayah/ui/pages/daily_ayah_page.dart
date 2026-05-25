import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/responsive/responsive_breakpoints.dart';
import '../../logic/provider/daily_ayah_provider.dart';
import '../widgets/daily_ayah_card.dart';
import '../widgets/daily_ayah_unavailable_card.dart';

class DailyAyahPage extends ConsumerWidget {
  const DailyAyahPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dailyAyah = ref.watch(dailyAyahProvider);

    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).dailyAyah)),
      body: SafeArea(
        top: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return ListView(
              padding: EdgeInsets.symmetric(
                horizontal:
                    constraints.maxWidth >= ResponsiveBreakpoints.wideNavigation
                    ? 32
                    : 16,
                vertical: 16,
              ),
              children: [
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: ResponsiveBreakpoints.maxContentWidth,
                    ),
                    child: dailyAyah.when(
                      data: (ayah) => DailyAyahCard(dailyAyah: ayah),
                      loading: () => const DailyAyahUnavailableCard(),
                      error: (error, stackTrace) =>
                          const DailyAyahUnavailableCard(),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
