import '../../../logic/entity/auth_session.dart';
import '../../../logic/entity/auth_user.dart';
import '../../../logic/repository/auth_repository.dart';
import '../../datasources/firebase_auth_datasource.dart';

class FirebaseAuthRepository implements AuthRepository {
  const FirebaseAuthRepository(this._datasource);

  final FirebaseAuthDatasource _datasource;

  @override
  Stream<AuthSession> watchSession() {
    return _datasource.authStateChanges().map((user) {
      if (user == null) {
        return const AuthSession.guest();
      }

      return AuthSession.loggedIn(user);
    });
  }

  @override
  Future<AuthUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    return _datasource.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signOut() {
    return _datasource.signOut();
  }
}
