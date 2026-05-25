import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../sync/sync_providers.dart';

final onlineStatusProvider = StreamProvider<bool>((ref) async* {
  final connectivity = ref.watch(connectivitySyncListenerProvider);
  yield await connectivity.isOnline();
  yield* connectivity.watchOnlineStatus();
});
