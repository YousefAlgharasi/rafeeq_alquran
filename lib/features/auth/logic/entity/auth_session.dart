import 'auth_user.dart';

class AuthSession {
  const AuthSession._({
    required this.user,
    required this.isGuest,
  });

  const AuthSession.guest() : this._(user: null, isGuest: true);

  const AuthSession.loggedIn(AuthUser user)
    : this._(user: user, isGuest: false);

  final AuthUser? user;
  final bool isGuest;

  bool get isLoggedIn => user != null;
}
