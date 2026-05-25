import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:rafeeq_alquran/main.dart';

void main() {
  testWidgets('app shell loads with phone bottom navigation', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const RafeqAlQuranApp(locale: Locale('en')));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Home'), findsWidgets);
    expect(find.byType(NavigationBar), findsOneWidget);
    expect(find.byType(NavigationRail), findsNothing);
  });

  testWidgets('app shell uses navigation rail on wide screens', (tester) async {
    tester.view.physicalSize = const Size(900, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const RafeqAlQuranApp(locale: Locale('en')));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.byType(NavigationRail), findsOneWidget);
    expect(find.byType(NavigationBar), findsNothing);
  });

  testWidgets('Arabic locale uses RTL text direction', (tester) async {
    await tester.pumpWidget(const RafeqAlQuranApp(locale: Locale('ar')));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    final directionality = tester.widget<Directionality>(
      find
          .descendant(
            of: find.byType(MaterialApp),
            matching: find.byType(Directionality),
          )
          .first,
    );

    expect(directionality.textDirection, TextDirection.rtl);
    expect(find.text('الرئيسية'), findsWidgets);
  });

  testWidgets('English locale uses LTR text direction', (tester) async {
    await tester.pumpWidget(const RafeqAlQuranApp(locale: Locale('en')));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    final directionality = tester.widget<Directionality>(
      find
          .descendant(
            of: find.byType(MaterialApp),
            matching: find.byType(Directionality),
          )
          .first,
    );

    expect(directionality.textDirection, TextDirection.ltr);
    expect(find.text('Home'), findsWidgets);
  });
}
