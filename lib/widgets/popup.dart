import 'package:autorization/components/settings/confirm_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildPopupDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
    title: const Text('Authentication failed'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("User does not exist"),
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
    throw UnimplementedError();
  }
}

