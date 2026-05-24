import 'package:flutter_test/flutter_test.dart';
import 'package:rafeeq_alquran/core/sync/sync_conflict_policy.dart';

void main() {
  test('last-write-wins chooses the payload with newer updated_at', () {
    const policy = LastWriteWinsConflictPolicy();

    final result = policy.merge(
      local: {
        'id': 1,
        'value': 'local',
        'updated_at': '2026-05-24T10:00:00.000Z',
      },
      remote: {
        'id': 1,
        'value': 'remote',
        'updated_at': '2026-05-24T09:00:00.000Z',
      },
    );

    expect(result['value'], 'local');
  });
}
