import 'package:flutter/material.dart';

class BuildPopupDialogUserExists extends StatelessWidget {
  const BuildPopupDialogUserExists({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Registration failed'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text('User already exists'),
        ],
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}