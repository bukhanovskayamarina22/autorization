import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String tag = 'home-page';

  @override
  Widget build(BuildContext context) {
    final text = Text('Logged in');

    return Center(child: Scaffold(body: text),);
  }
}