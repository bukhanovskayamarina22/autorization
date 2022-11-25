
import 'package:autorization/constants/controllers.dart';
import 'package:autorization/pages/settings_page.dart';
import 'package:autorization/provider/theme_provider.dart';
import 'package:autorization/src/custom_icons.dart';
import 'package:autorization/src/database_helper.dart';
import 'package:autorization/src/google_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'components/settings/settings_button.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'package:hive/hive.dart';

void main() {
  startBase();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {

   final _formKey = GlobalKey<FormState>();

  final routes = <String, WidgetBuilder>{
    // LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
  };
  Locale _locale = Locale('en', '');

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, _) {
        final themeProvider = Provider.of<ThemeProvider>(context);

        return MaterialApp(
          title: 'Kodeversitas',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: _locale,
          themeMode: themeProvider.themeMode,
          theme: MyThemes.lightTheme,
          darkTheme: MyThemes.darkTheme,
          home: LoginPage(),
          routes: routes,
        );
      });
}




