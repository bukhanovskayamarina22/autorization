// ignore_for_file: prefer_const_constructors


import 'package:autorization/constants/controllers.dart';

import 'package:autorization/pages/settings_page.dart';

import 'package:autorization/provider/user_input_email_provider.dart';
import 'package:autorization/provider/user_input_password_provider.dart';

import 'package:autorization/src/custom_icons.dart';
import 'package:autorization/src/google_login.dart';
import 'package:autorization/src/user.dart';
import 'package:flutter/material.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:provider/provider.dart';

import '../components/settings/settings_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../db/database_helper.dart';
import 'home_page.dart';

import '../widgets/popup.dart';


class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
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
  final settings = SettingsButton();

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
                          var opendb = await databaseHelper.openDatabase();
                          var openBox = await databaseHelper.openBox();
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