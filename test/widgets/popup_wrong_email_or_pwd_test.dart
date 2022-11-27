import 'package:autorization/provider/locale_provider.dart';
import 'package:autorization/provider/theme_provider.dart';
import 'package:autorization/widgets/popup_wrong_email_or_pwd.dart';
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
            home: ButtonForPop(),
          );
        });
  }

  testWidgets('popup Wrong Email or Pwd has been renderer', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest());
    var button = find.text("PopupCheck");
    await tester.tap(button);
    await tester.pump();
    expect(find.byType(AlertDialog), findsOneWidget);
  });

  group("Widget content check", () {
    testWidgets("Check title", (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      var button = find.text("PopupCheck");
      await tester.tap(button);
      await tester.pump();
      expect(find.byKey(ValueKey("Title user exist")), findsOneWidget);
      expect(find.text('Authentication failed'), findsOneWidget);
    });
    testWidgets("Check content", (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      var button = find.text("PopupCheck");
      await tester.tap(button);
      await tester.pump();
      expect(find.byKey(ValueKey("Body user exist")), findsOneWidget);
      expect(find.text('Wrong email and/or password'), findsOneWidget);
    });
  });

  group("Button popup tests", () {
    testWidgets("Check button render", (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      var button = find.text("PopupCheck");
      await tester.tap(button);
      await tester.pump();
      expect(find.byType(ElevatedButton), findsOneWidget);
      expect(find.text('OK'), findsOneWidget);
    });
    testWidgets("Check press button click", (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      var button = find.text("PopupCheck");
      await tester.tap(button);
      await tester.pump();
      var buttonPopup = find.byType(ElevatedButton);
      await tester.tap(buttonPopup);
      await tester.pump();
      expect(find.text("PopupCheck"), findsOneWidget);
    });
  });
}

class ButtonForPop extends StatelessWidget {
  const ButtonForPop({super.key});
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) =>
                BuildPopupDialogWrongEmailOrPwd(),
          );
        },
        child: Text("PopupCheck"));
  }
}
