import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BuildPopupDialogWrongEmailOrPwd extends StatelessWidget {
  const BuildPopupDialogWrongEmailOrPwd({super.key});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(AppLocalizations.of(context)!.pageLoginPopupAuthTitle,
          key: const Key("Title wrong email or pwd")),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(AppLocalizations.of(context)!.pageLoginPopupAuthText,
              key: const Key("Body wrong email or pwd")),
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
