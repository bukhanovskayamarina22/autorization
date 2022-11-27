import 'package:autorization/main.dart';
import 'package:autorization/pages/settings_page.dart';
import 'package:autorization/provider/locale_provider.dart';
import 'package:autorization/provider/theme_provider.dart';
import 'package:autorization/widgets/toggle_button_language.dart';
import 'package:autorization/widgets/toggle_button_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
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
            home: SettingsPage(),
          );
        });
  }

  testWidgets('Settings page has been loaded', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    final settingsPage = find.byType(SettingsPage);
    expect(settingsPage, findsOneWidget);
  });

  group("Settings page AppBar tests", () {
    testWidgets("AppBar has been rendered", (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final settingsPage = find.byType(AppBar);
      expect(settingsPage, findsOneWidget);
    });
    testWidgets("AppBar title has been rendered", (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      const testKey = Key('AppBar Text');

      expect(find.byKey(testKey), findsOneWidget);
      expect(find.text("Settings"), findsOneWidget);
    });
  });

  group("Settings page Body tested", () {
    testWidgets("Body has been rendered", (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      var key1 = find.byKey(Key("Conteiner for body SettingsPage"));
      var key2 = find.byKey(Key("Column Settings"));

      expect(key1, findsOneWidget);
      expect(key2, findsOneWidget);
      expect(find.byType(LanguageSettings), findsOneWidget);
      expect(find.byType(ThemeSettings), findsOneWidget);
    });

    testWidgets("LanguageSettings has been rendered",
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      var key1 = find.byKey(Key("Row for Languages"));

      expect(key1, findsOneWidget);
      expect(find.byType(TextLanguage), findsOneWidget);
      expect(find.byType(ToggleButtonLanguage), findsOneWidget);
    });

    testWidgets("TextLanguage has been rendered", (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      var key1 = find.byKey(Key("Field for TextLanguage"));
      expect(key1, findsOneWidget);
      expect(find.text("Language"), findsOneWidget);
    });

    testWidgets("ThemeSettigns has been rendered", (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      var key1 = find.byKey(Key("Row for themes"));

      expect(key1, findsOneWidget);
      expect(find.byType(ThemeText), findsOneWidget);
      expect(find.byType(ToggleButtonTheme), findsOneWidget);
    });

    testWidgets("TextTheme has been rendered", (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      var key1 = find.byKey(Key("Field for TextTheme"));
      expect(key1, findsOneWidget);
      expect(find.text("Theme"), findsOneWidget);
    });
  });
}
