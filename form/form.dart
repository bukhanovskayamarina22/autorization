import 'package:autorization/components/autorization/username_field.dart';
import 'package:autorization/constants/controllers.dart';
import 'package:autorization/pages/settings_page.dart';
import 'package:autorization/src/custom_icons.dart';
import 'package:autorization/src/google_login.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
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

  final email = UsernameField();
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
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
                  icon: Icon(CustomIcons.settings)
                  ),
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
                    // label: Text(AppLocalizations.of(context)!.pageLoginUsername),
                    // hintText: AppLocalizations.of(context)!.pageLoginUsernameHelp,
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value)) {
                      // return AppLocalizations.of(context)!.pageLoginUsernameError;
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
                    // label: Text(AppLocalizations.of(context)!.pageLoginPassword),
                    // hintText: AppLocalizations.of(context)!.pageLoginPasswordHelp,
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    if (value.length < 7) {
                      // return AppLocalizations.of(context)!.pageLoginPasswordError;
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: SizedBox(
                  width: 350,
                  child: ElevatedButton(
                    onPressed: () {
                      print(_formKey.currentState);
                      // Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
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
                      child: Text("data"),
                      // child: Text(AppLocalizations.of(context)!.pageLoginButtonGoogle)),
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
                    // child: Text(AppLocalizations.of(context)!.pageLoginButtonApple)),
                    child: Text('data'),
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


class ConfirmButton extends StatefulWidget {
  const ConfirmButton({super.key});
  @override
  State<ConfirmButton> createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<ConfirmButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Align(
          widthFactor: 1,
          heightFactor: 1,
          alignment: Alignment.bottomCenter,
          child: const Text("Confirm"),
        ));
  }
}


// class LoginPage extends StatelessWidget {
//   static String tag = 'login-page';
//   @override
//   final _formKey = GlobalKey<FormState>();
// }


// class _LoginPageState extends State<LoginPage> {
//       

//     final password = PasswordField();

//     final loginButton = SubmitButton();

//     final googleAuth = GoogleAuth();

//     final appleAuth = AppleAuth();

//     final settings = SettingsButton();
//   @override
//   Widget build(BuildContext context) {


//     return Scaffold(
//       body: Center(
//         child: SizedBox(
//           width: 400.0,
//           height: 600.0,
//           child: Center(
//             child: ListView(
//               shrinkWrap: true,
//               padding: EdgeInsets.only(left: 24.0, right: 24.0),
//               children: <Widget>[
//                 settings,
//                 email,
//                 SizedBox(height: 8.0),
//                 password,
//                 SizedBox(height: 24.0),
//                 loginButton,
//                 googleAuth,
//                 appleAuth,
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

