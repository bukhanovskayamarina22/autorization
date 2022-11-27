import 'package:autorization/main.dart';
import 'package:autorization/pages/home_page.dart';
import 'package:autorization/pages/login_page.dart';
import 'package:autorization/provider/locale_provider.dart';
import 'package:autorization/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  final routes = <String, WidgetBuilder>{
    // LoginPage.tag: (context) => LoginPage(),
  };

  Widget createWidgetUnderTest() {
    return MyApp();
  }

  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows building and interacting
  // with widgets in the test environment.
  testWidgets('MyApp\'s Material All widget has been loaded successfully',
      (tester) async {
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(createWidgetUnderTest());

    // Create the Finders.
    final myAppMaterialApp = find.byKey(ValueKey('MaterialAppKey'));

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(myAppMaterialApp, findsOneWidget);
  });

  testWidgets("LoginPage has been loaded", (tester) async {
    await tester.pumpWidget(createWidgetUnderTest());
    final loginPage = find.byType(LoginPage);
    expect(loginPage, findsOneWidget);
  });
}
