import 'package:flutter/material.dart';

class NoSuchUser extends StatelessWidget {
  static String tag = 'no-such-user';

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    final text = Text(
      'User does not exist',
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
