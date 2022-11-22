import 'package:flutter/material.dart';
import 'package:autorization/constants/controllers.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.all(8.0),
      child:    TextFormField(
        controller: passwordController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          label: Text("password"),
          hintText: "at least 8 symbols",
        ),
        // The validator receives the text that the user has entered.
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          if (value.length < 7) {
            return 'Password should be at least 8 symbols';
          }
        },
      ),
    );
  }
}
