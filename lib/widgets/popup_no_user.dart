import 'package:flutter/material.dart';

class BuildPopupDialogNoUser extends StatelessWidget {
  const BuildPopupDialogNoUser({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Authentication failed'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text('No such user'),
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
