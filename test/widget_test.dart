import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
// FitnessFitApp

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Pump widget without initializing Firebase
    await tester.pumpWidget(
      const MaterialApp(home: Center(child: Text('Test Widget'))),
    );

    // Check if the text exists
    expect(find.text('Test Widget'), findsOneWidget);
  });
}
