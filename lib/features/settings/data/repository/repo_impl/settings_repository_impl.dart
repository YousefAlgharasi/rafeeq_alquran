import 'dart:convert';

import '../../../../../core/sync/sync_queue_manager.dart';
import '../../../../auth/logic/entity/auth_session.dart';
import '../../../logic/entity/app_language.dart';
import '../../../logic/repository/settings_repository.dart';
import '../../datasources/settings_preferences_datasource.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  const SettingsRepositoryImpl({
    required SettingsPreferencesDatasource datasource,
    SyncQueueManager? syncQueueManager,
    AuthSession session = const AuthSession.guest(),
  }) : _datasource = datasource,
       _syncQueueManager = syncQueueManager,
       _session = session;

  final SettingsPreferencesDatasource _datasource;
  final SyncQueueManager? _syncQueueManager;
  final AuthSession _session;

  @override
  Future<AppLanguage> getLanguage() {
    return _datasource.getLanguage();
  }

  @override
  Future<void> saveLanguage(AppLanguage language) async {
    await _datasource.saveLanguage(language);
    await _syncQueueManager?.enqueueLocalChange(
      session: _session,
      entityType: 'profile_settings',
      localEntityId: 0,
      operation: 'upsert',
      payloadJson: jsonEncode({
        'setting_key': 'language',
        'value': language.languageCode,
        'value_type': 'string',
      }),
    );
  }

  @override
  Future<bool> getShowTranslations() {
    return _datasource.getShowTranslations();
  }

  @override
  Future<void> saveShowTranslations(bool isEnabled) async {
    await _datasource.saveShowTranslations(isEnabled);
    await _syncQueueManager?.enqueueLocalChange(
      session: _session,
      entityType: 'profile_settings',
      localEntityId: 0,
      operation: 'upsert',
      payloadJson: jsonEncode({
        'setting_key': 'show_translations',
        'value': isEnabled,
        'value_type': 'bool',
      }),
    );
  }
}
