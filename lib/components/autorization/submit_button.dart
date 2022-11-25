import 'package:autorization/src/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/controllers.dart';
import '../../pages/home_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SubmitButton extends StatefulWidget {
  SubmitButton({
    Key? key,
    required GlobalKey formkey,
  })  : super(key: key);


  @override
  State<SubmitButton> createState() => _SubmitButtonState();
}
class _SubmitButtonState extends State<SubmitButton> {

  final _formKey = GlobalKey<FormState>();
  void _submit() {
    final isValid = _formKey.currentState!.validate();
      if (!isValid) {
        return; 
      }
      _formKey.currentState!.save();
  }
  @override
  Widget build(BuildContext context) {
    var user1 = User(email: 'user1@gmail.com', password: 'password1');
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            Navigator.of(context).pushNamed(HomePage.tag);
            var user = User(
            email: emailController.text, password: passwordController.text);
          }
        },
        child: Center(
          widthFactor: 8,
          child: Text(AppLocalizations.of(context)!.pageLoginButtonSubmit),
        ),
      ),
    );
  }
}
