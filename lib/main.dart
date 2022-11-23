import 'package:autorization/constants/controllers.dart';
import 'package:autorization/constants/language_class.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'components/autorization/custom_form.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
  };
  Locale _locale = Locale('en', '');

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    const appTitle = 'Form Validation Demo';
    return MaterialApp(
      title: 'Kodeversitas',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito',
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}

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
