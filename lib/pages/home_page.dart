import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String text;
  HomePage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    final text = Text(
      this.text,
      key: Key("Text in center page"),
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
