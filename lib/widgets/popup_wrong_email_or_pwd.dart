import 'package:flutter/material.dart';

class BuildPopupDialogWrongEmailOrPwd extends StatelessWidget {
  const BuildPopupDialogWrongEmailOrPwd({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Authentication failed'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text('Wrong email and/or password'),
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