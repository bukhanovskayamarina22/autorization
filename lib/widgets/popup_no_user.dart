import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BuildPopupDialogNoUser extends StatelessWidget {
  const BuildPopupDialogNoUser({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Authentication failed'),
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
