
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'package:autorization/provider/locale_provider.dart';
import 'package:autorization/provider/theme_provider.dart';
import 'package:autorization/src/db/database_helper.dart';

import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() async {
  await startBase();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();

  // ignore: library_private_types_in_public_api
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();

  final routes = <String, WidgetBuilder>{
    // LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
  };

  @override
  Widget build(BuildContext context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ThemeProvider()),
            ChangeNotifierProvider(
                create: (context) => LocaleProvider(const Locale('en', ''))),
          ],
          builder: (context, child) {
            ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
            LocaleProvider localeProvider =
                Provider.of<LocaleProvider>(context);
            return MaterialApp(
              title: 'Kodeversitas',
              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              locale: localeProvider.locale,
              themeMode: themeProvider.themeMode,
              theme: MyThemes.lightTheme,
              darkTheme: MyThemes.darkTheme,
              home: LoginPage(),
              routes: routes,
            );
          });
}
