import 'package:flutter/material.dart';

class RegisteredPage extends StatelessWidget {
  static String tag = 'registered-page';

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    final text = Text(
      'Registered',
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