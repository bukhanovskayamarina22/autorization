import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final text = Text(
      'Logged in',
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: Center(
          child: text,
        ));
  }
}
