import 'package:flutter/material.dart';
import 'package:autorization/constants/controllers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        controller: passwordController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text(AppLocalizations.of(context)!.pageLoginPassword),
          hintText: AppLocalizations.of(context)!.pageLoginPasswordHelp,
        ),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          if (value.length < 7) {
            return AppLocalizations.of(context)!.pageLoginPasswordError;
          }
        },
      ),
    );
  }
}
