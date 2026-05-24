import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/features/quran_content/data/datasources/blocked_quran_foundation_datasource.dart';

void main() {
  test('blocked datasource fails clearly instead of making fake API calls',
      () async {
    const datasource = BlockedQuranFoundationDatasource();

    expect(
      datasource.getChapters,
      throwsA(isA<QuranFoundationAccessBlockedException>()),
    );
  });

  test('blocked error message does not expose secrets', () {
    const error = QuranFoundationAccessBlockedException();

    expect(error.toString(), contains('server-side proxy'));
    expect(error.toString(), isNot(contains('client_secret')));
    expect(error.toString(), isNot(contains('QF_CLIENT_SECRET')));
  });
}
