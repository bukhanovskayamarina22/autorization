import 'package:autorization/pages/autorization/password_field.dart';
import 'package:autorization/pages/autorization/submit_button.dart';
import 'package:autorization/pages/autorization/username_field.dart';
import 'package:flutter/material.dart';

import 'apple_auth.dart';
import 'google_auth.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  CustomFormState createState() {
    return CustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class CustomFormState extends State<CustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Center(
        widthFactor: 30,
        heightFactor: 30,
        child: ConstrainedBox(
          constraints: const BoxConstraints.tightFor(width: 300),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            MyPadding(100.0),
            UsernameField(),
            MyPadding(10.0),
            PasswordField(),
            MyPadding(10.0),
            SubmitButton(formKey: _formKey),
            MyPadding(50.0),
            Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                // Full width button 2
                GoogleAuth(),
                const SizedBox(
                  height: 20,
                ),
                AppleAuth(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Padding MyPadding(double verticalPadding) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
    );
  }
}
