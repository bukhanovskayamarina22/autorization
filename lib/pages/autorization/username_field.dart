import 'package:flutter/material.dart';
import 'package:autorization/constants/controllers.dart';

class UsernameField extends StatefulWidget {
  const UsernameField({
    Key? key,
  }) : super(key: key);

  @override
  State<UsernameField> createState() => _UsernameFieldState();
}

class _UsernameFieldState extends State<UsernameField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(language_now.username),
        hintText: language_now.email,
      ),
      // The validator receives the text that the user has entered.
      validator: (value) {
        if (value == null ||
            value.isEmpty ||
            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value)) {
          return 'Enter valid email';
        }
        return null;
      },
    );
  }
}
