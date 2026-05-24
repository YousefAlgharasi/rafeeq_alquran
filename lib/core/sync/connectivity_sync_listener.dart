import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivitySyncListener {
  ConnectivitySyncListener({
    Connectivity? connectivity,
  }) : _connectivity = connectivity ?? Connectivity();

  final Connectivity _connectivity;

  Stream<bool> watchOnlineStatus() {
    return _connectivity.onConnectivityChanged.map(_isOnline).distinct();
  }

  Future<bool> isOnline() async {
    return _isOnline(await _connectivity.checkConnectivity());
  }

  bool _isOnline(List<ConnectivityResult> results) {
    return results.any((result) => result != ConnectivityResult.none);
  }
}
