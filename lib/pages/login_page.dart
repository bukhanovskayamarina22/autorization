import 'package:autorization/src/encryption.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive/hive.dart';
import 'package:autorization/constants/controllers.dart';
import 'package:autorization/pages/settings_page.dart';
import 'package:autorization/src/custom_icons.dart';
import 'package:autorization/src/google_login.dart';
import 'package:autorization/src/google_user.dart';
import 'package:autorization/src/user.dart';
import 'package:autorization/widgets/popup_user_exists.dart';
import 'package:autorization/widgets/popup_wrong_email_or_pwd.dart';
import '../src/db/database_helper.dart';
import '../widgets/popup_no_user.dart';
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

  Future openGoogleBox({required DatabaseHelper databaseHelper}) async {
    var getBox = await databaseHelper.openGoogleBox();
    Box openBox = await databaseHelper.getGoogleBox();
    return openBox;
  }

  Future openUserBox({required DatabaseHelper databaseHelper}) async {
    var opendb = await databaseHelper.openUserBox();
    var openBox = await databaseHelper.getUserBox();
    return openBox;
  }

  void openHomePage({required String email}) {
    Navigator.push(context,
      MaterialPageRoute(
        builder: (context) => HomePage(text: 'Hello, $email'),
      ));
  }

  @override
  Widget build(BuildContext context) {
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
              //Settings
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsPage()));
                    },
                    icon: const Icon(CustomIcons.settings)),
              ),
              //Email
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
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
              //Password
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextFormField(
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Theme.of(context).iconTheme.color,
                    ),
                    border: const OutlineInputBorder(),
                    label: Text(AppLocalizations.of(context)!.pageLoginPassword),
                    hintText: AppLocalizations.of(context)!.pageLoginPasswordHelp,
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    if (value.length < 8) {
                      return AppLocalizations.of(context)!.pageLoginPasswordError;
                    }
                  },
                ),
              ),
              //Submit
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: SizedBox(
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () async {

                      var databaseHelper = await DatabaseHelper();
                      var box = await openUserBox(databaseHelper: databaseHelper);

                      Encryption encryption = await Encryption();

                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        var user = await User(

                            email: emailController.text,
                            password: passwordController.text).toString();
                        var mapUser = await User(
                            email: emailController.text,
                            password: passwordController.text).toMap();

                      String encryptedUser = encryption.encrypt(user);
                      String encryptedEmail = encryption.encrypt(emailController.text);

                        if (await databaseHelper.emailExists(box: box, encryptedEmail: encryptedEmail) == false) {

                          showDialog(
                            context: context,
                            builder: (BuildContext context) => BuildPopupDialogNoUser(),
                          );

                        } else if (await databaseHelper.userExists(box: box, encryptedUser: encryptedUser, encryptedEmail: encryptedEmail) != false) {
                          openHomePage(email: mapUser['email']);

                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                BuildPopupDialogWrongEmailOrPwd(),
                          );
                        }
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: Text(AppLocalizations.of(context)!.pageLoginButtonLogin),
                  ),
                ),
              ),
              //Sign up
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  width: 350,
                  child: MaterialButton(
                    onPressed: () async {
                      var databaseHelper = await DatabaseHelper();
                      var box = await openUserBox(databaseHelper: databaseHelper);

                      Encryption encryption = await Encryption();
                      print(_formKey.currentState);
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        var user = User(email: emailController.text,
                          password: passwordController.text);

                        var stringUser = await user.toString();
                        var mapUser = await user.toMap();

                        String encryptedUser = encryption.encrypt(stringUser);
                        String encryptedEmail = encryption.encrypt(emailController.text);

                        if (await databaseHelper.emailExists(box: box, encryptedEmail: encryptedEmail) != false) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                const BuildPopupDialogUserExists(),
                          );

                        } else {
                          databaseHelper.addUser(box: box, encryptedUser: encryptedUser, encryptedEmail: encryptedEmail);
                          openHomePage(email: '${mapUser['email']}');
                        }
                        // If the form is valid, display a snackbar. In the real world,
                        // you'd often call a server or save the information in a database.
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                      }
                    },
                    child: Text(AppLocalizations.of(context)!.pageLoginButtonRegistr),
                  ),
                ),
              ),
              //Google
              Padding(
                padding: EdgeInsets.only(top: 70),
                child: Container(
                  width: double.infinity,
                  color: Colors.transparent,
                  child: OutlinedButton(
                    onPressed: () async {
                      var googleUserLoginData = await GoogleLogin();
                      Encryption encryption = await Encryption();
                      var user = GoogleUser(responseBody: googleUserLoginData);
                      Map mapUser = user.toMap();
                      String encryptedUser = encryption.encrypt(googleUserLoginData);
                      String encryptedEmail = encryption.encrypt(mapUser['email']);

                      if (googleUserLoginData != false) {
                        DatabaseHelper databaseHelper = await DatabaseHelper();

                        var box = await openGoogleBox(databaseHelper: databaseHelper);

                        if(await databaseHelper.emailExists(box: box, encryptedEmail: encryptedEmail) == false) {
                          await databaseHelper.addUser(box: box, encryptedUser: encryptedUser, encryptedEmail: encryptedEmail);
                        } 
                        openHomePage(email: '${mapUser['email']}');                                

                      }
                    },
                    child: Text(
                        AppLocalizations.of(context)!.pageLoginButtonGoogle),
                  ),
                ),
              ),
              //Apple
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
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
}

// class PasswordWidget extends StatelessWidget {
//   const PasswordWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
    
//   }
// }

// class SubmitButton extends StatelessWidget {
//   const SubmitButton({
//     Key? key,
//     required GlobalKey<FormState> formKey,
//   })  : _formKey = formKey,
//         super(key: key);

//   final GlobalKey<FormState> _formKey;

//   @override
//   Widget build(BuildContext context) {
    
//   }
// }

// class ButtonSignUp extends StatelessWidget {
//   const ButtonSignUp({
//     Key? key,
//     required GlobalKey<FormState> formKey,
//   })  : _formKey = formKey,
//         super(key: key);

//   final GlobalKey<FormState> _formKey;

//   @override
//   Widget build(BuildContext context) {
    
//   }
// }
