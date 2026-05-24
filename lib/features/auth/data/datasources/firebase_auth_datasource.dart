import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_core/firebase_core.dart';

import '../models/auth_user_model.dart';

class AuthFailure implements Exception {
  const AuthFailure(this.message);

  final String message;

  @override
  String toString() => message;
}

class FirebaseAuthDatasource {
  FirebaseAuthDatasource({
    firebase_auth.FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  final firebase_auth.FirebaseAuth? _firebaseAuth;

  firebase_auth.FirebaseAuth get _auth {
    if (_firebaseAuth != null) {
      return _firebaseAuth;
    }

    if (Firebase.apps.isEmpty) {
      throw const AuthFailure('Firebase is not configured yet.');
    }

    return firebase_auth.FirebaseAuth.instance;
  }

  Stream<AuthUserModel?> authStateChanges() {
    if (_firebaseAuth == null && Firebase.apps.isEmpty) {
      return Stream.value(null);
    }

    return _auth.authStateChanges().map((user) {
      if (user == null) {
        return null;
      }

      return AuthUserModel.fromFirebaseUser(user);
    });
  }

  Future<AuthUserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;
      if (user == null) {
        throw const AuthFailure('Firebase did not return a signed-in user.');
      }

      return AuthUserModel.fromFirebaseUser(user);
    } on firebase_auth.FirebaseAuthException catch (error) {
      throw AuthFailure(error.message ?? error.code);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
