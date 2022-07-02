// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cats/app.dart';
import 'package:cats/core/di.dart' as di;

void main() {
  setUpAll(() {
    di.init();
  });

  testWidgets('Render listpage', (WidgetTester tester) async {
    await tester.pumpWidget(const App());
    expect(find.byKey(const Key('textfield')), findsOneWidget);
  });
}
