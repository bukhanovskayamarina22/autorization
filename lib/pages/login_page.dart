
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:autorization/constants/controllers.dart';
import 'package:autorization/pages/settings_page.dart';
import 'package:autorization/provider/user_input_email_provider.dart';
import 'package:autorization/provider/user_input_password_provider.dart';
import 'package:autorization/src/custom_icons.dart';
import 'package:autorization/src/google_login.dart';
import 'package:autorization/src/user.dart';

import '../components/settings/settings_button.dart';
import '../db/database_helper.dart';

import '../widgets/popup.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: MyCustomForm(),
      );
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final settings = const SettingsButton();

  @override
  Widget build(BuildContext context) => MultiProvider(
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
                                      builder: (context) =>
                                          const SettingsPage()));
                            },
                            icon: const Icon(CustomIcons.settings)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Theme.of(context).iconTheme.color,
                            ),
                            border: OutlineInputBorder(),
                            label: Text(AppLocalizations.of(context)!
                                .pageLoginUsername),
                            hintText: AppLocalizations.of(context)!
                                .pageLoginUsernameHelp,
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
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              color: Theme.of(context).iconTheme.color,
                            ),
                            border: const OutlineInputBorder(),
                            label: Text(AppLocalizations.of(context)!
                                .pageLoginPassword),
                            hintText: AppLocalizations.of(context)!
                                .pageLoginPasswordHelp,
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

                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 70),
                    child: Container(
                      width: double.infinity,
                      color: Colors.transparent,
                      child: OutlinedButton(
                        onPressed: () {
                          signIn(context);
                        },
                        child: Text(
                            AppLocalizations.of(context)!.pageLoginButtonGoogle),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: SizedBox(
                          width: 350,
                          child: ElevatedButton(
                            onPressed: () async {
                              var databaseHelper = await DatabaseHelper();
                              var opendb = await databaseHelper.openUserBox();
                              var openBox = await databaseHelper.getUserBox();
                              print(_formKey.currentState);
                              // Validate returns true if the form is valid, or false otherwise.
                              if (_formKey.currentState!.validate()) {
                                var user = await User(
                                    email: emailController.text,
                                    password: passwordController.text);
                                var userExistsString = await databaseHelper
                                    .userExists(box: openBox, user: user);
                                if (userExistsString != "no such user") {
                                  // ignore: use_build_context_synchronously
                                  Navigator.of(context).pushNamed(HomePage.tag);
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        BuildPopupDialog(),
                                  );
                                  // Navigator.of(context).pushNamed(NoSuchUser.tag);
                                }
                                print(userExistsString);
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Processing Data')),
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
                              signIn(context);
                            },
                            child: Text(AppLocalizations.of(context)!
                                .pageLoginButtonGoogle),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Container(
                          width: double.infinity,
                          color: Colors.transparent,
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text(AppLocalizations.of(context)!
                                .pageLoginButtonApple),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
}
