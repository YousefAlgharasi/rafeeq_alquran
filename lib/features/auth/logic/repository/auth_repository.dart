import '../entity/auth_session.dart';
import '../entity/auth_user.dart';

abstract class AuthRepository {
  Stream<AuthSession> watchSession();

  Future<AuthUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<AuthUser> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();
}
