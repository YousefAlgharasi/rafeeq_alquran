import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      await Firebase.initializeApp();
    }

    return const FirebaseInitializationResult.initialized();
  } catch (error) {
    return FirebaseInitializationResult.notConfigured(error);
  }
}

final firebaseInitializationProvider =
    FutureProvider<FirebaseInitializationResult>((ref) {
      return initializeFirebase();
    });
