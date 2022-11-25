import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    final text = Text(
      'Logged in',
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );

    return Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        body: Center(
          child: text,
        ));
  }
}
