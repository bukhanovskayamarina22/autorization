import 'package:autorization/components/settings/setting_button.dart';
import 'package:flutter/material.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'components/autorization/custom_form.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
    final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
  };

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';
      return MaterialApp(
        title: 'Kodeversitas',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          fontFamily: 'Nunito',
        ),
        home: LoginPage(),
        routes: routes,
      );

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
  }
}
