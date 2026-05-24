import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/features/auth/logic/entity/auth_session.dart';
import 'package:rafeeq_alquran/features/auth/logic/entity/auth_user.dart';

void main() {
  test('guest session is local-only and not logged in', () {
    const session = AuthSession.guest();

    expect(session.isGuest, isTrue);
    expect(session.isLoggedIn, isFalse);
    expect(session.user, isNull);
  });

  test('logged-in session exposes authenticated user', () {
    const user = AuthUser(id: 'user-1', email: 'user@example.com');
    const session = AuthSession.loggedIn(user);

    expect(session.isGuest, isFalse);
    expect(session.isLoggedIn, isTrue);
    expect(session.user, user);
  });
}
