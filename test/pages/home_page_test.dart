import 'package:autorization/pages/home_page.dart';
import 'package:autorization/provider/locale_provider.dart';
import 'package:autorization/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Widget createWidgetUnderTest() {
  return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(
            create: (context) => LocaleProvider(const Locale('en', ''))),
      ],
      builder: (context, child) {
        ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
        LocaleProvider localeProvider = Provider.of<LocaleProvider>(context);
        return MaterialApp(
          key: Key('MaterialAppKey'),
          title: 'Kodeversitas',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: localeProvider.locale,
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          home: HomePage(text: 'Text',),
        );
      });
}

void main() {
  testWidgets('Settings page has been loaded', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    final settingsPage = find.byType(HomePage);
    expect(settingsPage, findsOneWidget);
  });

  group("Home page AppBar tests", () {
    testWidgets("AppBar has been rendered", (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final settingsPage = find.byType(AppBar);
      expect(settingsPage, findsOneWidget);
    });
    testWidgets("AppBar title has been rendered", (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.text("Home Page"), findsOneWidget);
    });
  });

  group("Home page body tests", () {
    testWidgets("Body has been rendered", (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final settingsPage = find.byType(Center);
      expect(settingsPage, findsOneWidget);
    });
    testWidgets("Body text has been rendered", (WidgetTester tester) async {
      var userEmail = 'name@example.com';
      await tester.pumpWidget(createWidgetUnderTest());

      expect(find.byKey(ValueKey("Text in center page")), findsOneWidget);
      expect(find.text("Hello, name@example"), findsOneWidget);
    });
  });
}
