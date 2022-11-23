import 'package:flutter/material.dart';
import 'package:autorization/constants/controllers.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class UsernameField extends StatefulWidget {
  const UsernameField({
    Key? key,
  }) : super(key: key);

  @override
  State<UsernameField> createState() => _UsernameFieldState();
}

class _UsernameFieldState extends State<UsernameField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        controller: emailController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text(AppLocalizations.of(context)!.pageLoginUsername),
          hintText: AppLocalizations.of(context)!.pageLoginUsernameHelp,
        ),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null ||
              value.isEmpty ||
              !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                  .hasMatch(value)) {
            return AppLocalizations.of(context)!.pageLoginUsernameError;
          }
          return null;
        },
      ),
    );
  }
}
