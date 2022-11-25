import 'package:autorization/provider/theme_provider.dart';
import 'package:autorization/src/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
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

  /*) {
    print('build');
    const appTitle = 'Form Validation Demo';
    return MaterialApp(
      title: 'Kodeversitas',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      themeMode: ThemeMode.system,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      /*theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito',
      ),*/
      home: LoginPage(),
      routes: routes,
    );
  }
}*/

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     const appTitle = 'Form Validation Demo';
//       return MaterialApp(
//         title: 'Kodeversitas',
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           primarySwatch: Colors.lightBlue,
//           fontFamily: 'Nunito',
//         ),
//         home: LoginPage(),
//         routes: routes,
//       );

    // return MaterialApp(
    //   home: Scaffold(
    //     appBar: AppBar(
    //       title: const Text(appTitle),
    //     ),
    //     body: const Center(
    //       child: CustomForm(),
    //     ),
    //     floatingActionButton: const Settings(),
    //   ),

    // );
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text(appTitle),
//         ),
//         body: const Center(
//           child: CustomForm(),
//         ),
//         floatingActionButton: const SettingsButton(),
//       ),
//     );
//   }
// }
