import 'package:autorization/components/autorization/apple_auth.dart';
import 'package:autorization/components/autorization/google_auth.dart';
import 'package:flutter/material.dart';
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
    final _formKey = GlobalKey<FormState>();

    final email = UsernameField();

    final password = PasswordField();

    final loginButton = SubmitButton(
      formKey: _formKey,
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



<<<<<<< Updated upstream
//   }
// }
=======
  @override
  Widget build(BuildContext context) =>
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UsernameProvider()),
        ChangeNotifierProvider(create: (context) => PasswordProvider()),
      ],
      builder: (context, child) {
        return Center(
          child: Form(
            key: _formKey,
            child: SizedBox(
              width: 350.0,
              height: 600.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SettingsPage()));
                        },
                        icon: Icon(CustomIcons.settings)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                          color: Theme.of(context).iconTheme.color,
                        ),
                        border: OutlineInputBorder(),
                        label:
                            Text(AppLocalizations.of(context)!.pageLoginUsername),
                        hintText:
                            AppLocalizations.of(context)!.pageLoginUsernameHelp,
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value)) {
                          return AppLocalizations.of(context)!
                              .pageLoginUsernameError;
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                          color: Theme.of(context).iconTheme.color,
                        ),
                        border: OutlineInputBorder(),
                        label:
                            Text(AppLocalizations.of(context)!.pageLoginPassword),
                        hintText:
                            AppLocalizations.of(context)!.pageLoginPasswordHelp,
                      ),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        if (value.length < 7) {
                          return AppLocalizations.of(context)!
                              .pageLoginPasswordError;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: SizedBox(
                      width: 350,
                      child: ElevatedButton(
                        onPressed: () async {
                          var databaseHelper = await DatabaseHelper();
                          var opendb = await databaseHelper.openUserBox();
                          var openBox = await databaseHelper.getUsersBox();
                          print(_formKey.currentState);
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            var user = await User(email: emailController.text, password: passwordController.text);
                            var userExistsString =  await databaseHelper.userExists(box: openBox, user: user);
                            if (userExistsString != "no such user"){
                              Navigator.of(context).pushNamed(HomePage.tag);
                            }
                            else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => BuildPopupDialog(),
                              );
                              // Navigator.of(context).pushNamed(NoSuchUser.tag);
                            }
                            print(userExistsString);
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                        child: const Text('Submit'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 70),
                    child: Container(
                      width: double.infinity,
                      color: Colors.transparent,
                      child: OutlinedButton(
                        onPressed: () {
                          signIn();
                        },
                        child: Text(
                            AppLocalizations.of(context)!.pageLoginButtonGoogle),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Container(
                      width: double.infinity,
                      color: Colors.transparent,
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text(
                            AppLocalizations.of(context)!.pageLoginButtonApple),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }
>>>>>>> Stashed changes
