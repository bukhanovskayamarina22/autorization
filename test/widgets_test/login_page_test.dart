import 'package:autorization/main.dart';
import 'package:autorization/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows building and interacting
  // with widgets in the test environment.
  testWidgets('MyApp\'s Material All widget has been loaded successfully', (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(MyApp());
    

    // Create the Finders.
    final myAppMaterialApp = find.byKey(ValueKey('MaterialAppKey'));

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(myAppMaterialApp, findsOneWidget);
  });
}