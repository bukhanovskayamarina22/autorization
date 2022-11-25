import 'package:autorization/components/autorization/apple_auth.dart';
import 'package:autorization/components/autorization/google_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/autorization/username_field.dart';
import '../components/autorization/password_field.dart';
import '../components/autorization/submit_button.dart';
import '../components/settings/settings_button.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    final email = UsernameField();

    final password = PasswordField();
    final _formKey = GlobalKey<FormState>();

    final loginButton = SubmitButton(
      formkey: _formKey,
);

    final googleAuth = GoogleAuth();

    final appleAuth = AppleAuth();

    final settings = SettingsButton();

    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 400.0,
          height: 600.0,
          child: Center(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(left: 24.0, right: 24.0),
              children: <Widget>[
                settings,
                email,
                SizedBox(height: 8.0),
                password,
                SizedBox(height: 24.0),
                loginButton,
                googleAuth,
                appleAuth,
              ],
            ),
          ),
        ),
      ),
    );
  }

}
// class _LoginPageState extends StatelessWidget {
//   static String tag = 'home-page';

//   @override
//   Widget build(BuildContext context) {
//     

//     



//   }
// }