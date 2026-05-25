import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../firebase_options.dart';

class FirebaseInitializationResult {
  const FirebaseInitializationResult._({
    required this.isInitialized,
    this.error,
  });

  const FirebaseInitializationResult.initialized()
    : this._(isInitialized: true);

  const FirebaseInitializationResult.notConfigured(Object error)
    : this._(isInitialized: false, error: error);

  final bool isInitialized;
  final Object? error;
}

Future<FirebaseInitializationResult> initializeFirebase() async {
  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
    }

    return const FirebaseInitializationResult.initialized();
  } catch (error) {
    debugPrint('Firebase initialization failed: $error');
    return FirebaseInitializationResult.notConfigured(error);
  }
}

final firebaseInitializationProvider =
    FutureProvider<FirebaseInitializationResult>((ref) {
      return initializeFirebase();
    });
