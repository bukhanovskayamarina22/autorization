import 'package:autorization/provider/locale_provider.dart';
import 'package:autorization/provider/theme_provider.dart';
import 'package:autorization/widgets/toggle_button_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MockThemeProvider extends Mock implements ThemeProvider {}

void main() {
  late MockThemeProvider mockThemeProvider;

  setUp(() {
    mockThemeProvider = MockThemeProvider();
  });

  final isSelectedFromProvider = [true, false, false];
  final isSelected = isSelectedFromProvider;

  void isSelectedReturns() {
    when(() => mockThemeProvider.SelectThemeNow()).thenAnswer(
      (_) {
        return isSelectedFromProvider;
      },
    );
  }

  final List<String> themesText = ["System", "Dark", "Light"];

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
            home: const ToggleButtonLanguage(),
          );
        });
  }

  testWidgets('toggle button renderer', (tester) async {
    await tester.pumpWidget(createWidgetUnderTest());

    final toggleButton = find.byType(ToggleButtons);
    expect(toggleButton, findsOneWidget);
  });

  group("Tested toggle button language renderer", () {
    testWidgets('Renderer only 3 buttons', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());

      final toggleButtonTheme = find.byType(Text);
      expect(toggleButtonTheme, findsNWidgets(3));
    });

    //Проверить нажатие и изменения
    /*testWidgets('Initial toggle state is reflected', (tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
    });*/
  });
}
