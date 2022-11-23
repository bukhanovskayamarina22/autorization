import 'package:autorization/src/user.dart';
import 'package:flutter/material.dart';
import '../../constants/controllers.dart';
import '../../pages/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SubmitButton extends StatefulWidget {
  const SubmitButton({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends State<SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () async {
          var user = User(
              email: emailController.text, password: passwordController.text);
          Navigator.of(context).pushNamed(HomePage.tag);
          // // Validate returns true if the form is valid, or false otherwise.
        },
        child: Center(
          widthFactor: 8,
          child: Text(AppLocalizations.of(context)!.pageLoginButtonSubmit),
        ),
      ),
    );
  }
}
