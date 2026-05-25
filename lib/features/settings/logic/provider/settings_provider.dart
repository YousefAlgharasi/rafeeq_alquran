import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/sync/sync_providers.dart';
import '../../../auth/logic/entity/auth_session.dart';
import '../../../auth/logic/provider/auth_provider.dart';
import '../../data/datasources/settings_preferences_datasource.dart';
import '../../data/repository/repo_impl/settings_repository_impl.dart';
import '../entity/app_language.dart';
import '../repository/settings_repository.dart';

final settingsPreferencesDatasourceProvider =
    Provider<SettingsPreferencesDatasource>((ref) {
      return const SharedPreferencesSettingsDatasource();
    });

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  final session =
      ref.watch(authSessionProvider).value ?? const AuthSession.guest();
  return SettingsRepositoryImpl(
    datasource: ref.watch(settingsPreferencesDatasourceProvider),
    syncQueueManager: session.isLoggedIn
        ? ref.watch(syncQueueManagerProvider)
        : null,
    session: session,
  );
});

final appLanguageProvider =
    AsyncNotifierProvider<AppLanguageController, AppLanguage>(
      AppLanguageController.new,
    );

final showTranslationsProvider =
    AsyncNotifierProvider<ShowTranslationsController, bool>(
      ShowTranslationsController.new,
    );

class AppLanguageController extends AsyncNotifier<AppLanguage> {
  @override
  Future<AppLanguage> build() {
    return ref.watch(settingsRepositoryProvider).getLanguage();
  }

  Future<void> setLanguage(AppLanguage language) async {
    state = AsyncData(language);
    await ref.read(settingsRepositoryProvider).saveLanguage(language);
  }
}

class ShowTranslationsController extends AsyncNotifier<bool> {
  @override
  Future<bool> build() {
    return ref.watch(settingsRepositoryProvider).getShowTranslations();
  }

  Future<void> setShowTranslations(bool isEnabled) async {
    state = AsyncData(isEnabled);
    await ref.read(settingsRepositoryProvider).saveShowTranslations(isEnabled);
  }
}
