import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/core/database/app_database.dart';
import 'package:rafeeq_alquran/core/sync/sync_queue_manager.dart';
import 'package:rafeeq_alquran/features/auth/logic/entity/auth_session.dart';
import 'package:rafeeq_alquran/features/auth/logic/entity/auth_user.dart';
import 'package:rafeeq_alquran/features/settings/data/datasources/settings_preferences_datasource.dart';
import 'package:rafeeq_alquran/features/settings/data/repository/repo_impl/settings_repository_impl.dart';
import 'package:rafeeq_alquran/features/settings/logic/entity/app_language.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('persists selected language in SharedPreferences', () async {
    SharedPreferences.setMockInitialValues({});
    const repository = SettingsRepositoryImpl(
      datasource: SharedPreferencesSettingsDatasource(),
    );

    expect(await repository.getLanguage(), AppLanguage.english);

    await repository.saveLanguage(AppLanguage.arabic);

    expect(await repository.getLanguage(), AppLanguage.arabic);
  });

  test('persists show translations setting in SharedPreferences', () async {
    SharedPreferences.setMockInitialValues({});
    const repository = SettingsRepositoryImpl(
      datasource: SharedPreferencesSettingsDatasource(),
    );

    expect(await repository.getShowTranslations(), isTrue);

    await repository.saveShowTranslations(false);

    expect(await repository.getShowTranslations(), isFalse);
  });

  test('logged-in language changes create a sync queue entry', () async {
    SharedPreferences.setMockInitialValues({});
    final database = AppDatabase.forTesting(NativeDatabase.memory());
    addTearDown(database.close);
    final repository = SettingsRepositoryImpl(
      datasource: const SharedPreferencesSettingsDatasource(),
      syncQueueManager: SyncQueueManager(database),
      session: const AuthSession.loggedIn(
        AuthUser(id: 'user-1', email: 'user@example.com'),
      ),
    );

    await repository.saveLanguage(AppLanguage.arabic);

    final row = await database.select(database.syncQueue).getSingle();
    expect(row.ownerUserId, 'user-1');
    expect(row.entityType, 'profile_settings');
    expect(row.payloadJson, contains('"setting_key":"language"'));
  });
}
