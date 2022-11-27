import 'package:autorization/provider/locale_provider.dart';
import 'package:autorization/provider/theme_provider.dart';
import 'package:autorization/widgets/toggle_button_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

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
            home: ToggleButtonTheme(),
          );
        });
  }

  testWidgets('toggle button renderer', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    final toggleButton = find.byType(ToggleButtons);
    expect(toggleButton, findsOneWidget);
  });

  group("Tested toggle button theme renderer", () {
    testWidgets('Renderer only 3 buttons', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final toggleButtonTheme = find.byType(Text);
      expect(toggleButtonTheme, findsNWidgets(3));
    });

    //Проверить нажатие и изменения
    testWidgets('Initial toggle state is reflected', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      final List<bool> isSelected = <bool>[false, true];

      final toggleButton1 = find.text("System");
      final toggleButton2 = find.byKey(ValueKey("Second child"));
      final toggleButton3 = find.byKey(ValueKey("Third child"));
      print(toggleButton1);
      expect(toggleButton1, findsOneWidget);
    });
  });
}
