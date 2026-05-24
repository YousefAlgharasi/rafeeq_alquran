import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/responsive/responsive_breakpoints.dart';
import '../../../auth/logic/provider/auth_provider.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context);
    final session = ref.watch(authSessionProvider);

    return Scaffold(
      appBar: AppBar(title: Text(localizations.settings)),
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
                        localizations.account,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 16),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: session.when(
                            data: (data) {
                              final title = data.isLoggedIn
                                  ? localizations.loggedIn
                                  : localizations.guestMode;
                              final actionLabel = data.isLoggedIn
                                  ? localizations.openProfile
                                  : localizations.login;
                              final route =
                                  data.isLoggedIn ? '/profile' : '/login';

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    title,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(localizations.loginOptionalMessage),
                                  const SizedBox(height: 16),
                                  Align(
                                    alignment: AlignmentDirectional.centerStart,
                                    child: FilledButton(
                                      onPressed: () => context.go(route),
                                      child: Text(actionLabel),
                                    ),
                                  ),
                                ],
                              );
                            },
                            loading: () => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            error: (error, stackTrace) => Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(localizations.guestMode),
                                const SizedBox(height: 8),
                                Text(localizations.firebaseNotConfiguredMessage),
                                const SizedBox(height: 16),
                                Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: FilledButton(
                                    onPressed: () => context.go('/login'),
                                    child: Text(localizations.login),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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
