import 'package:autorization/src/user.dart';
import 'package:flutter/material.dart';
import '../../constants/controllers.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        var user = User(
            email: emailController.text, password: passwordController.text);

        // Validate returns true if the form is valid, or false otherwise.
        if (_formKey.currentState!.validate()) {
          // If the form is valid, display a snackbar. In the real world,
          // you'd often call a server or save the information in a database.
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Processing Data")),
          );
        }
        print('a');
      },
      // ignore: prefer_const_constructors
      child: Center(
        widthFactor: 8,
        child: Text(language_now.submit),
      ),
    );
  }
}
