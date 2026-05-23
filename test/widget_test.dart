import 'package:flutter_test/flutter_test.dart';

import 'package:rafeeq_alquran/main.dart';

void main() {
  testWidgets('bootstrap app renders', (WidgetTester tester) async {
    await tester.pumpWidget(const RafeqAlQuranApp());

    expect(find.text('رفيق القرآن'), findsWidgets);
    expect(
      find.text('Bootstrap complete. Feature UI starts in later tasks.'),
      findsOneWidget,
    );
  });
}
