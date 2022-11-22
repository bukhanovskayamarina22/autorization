import 'package:flutter/material.dart';

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
      onPressed: () {
        // Validate returns true if the form is valid, or false otherwise.
        if (_formKey.currentState!.validate()) {
          // If the form is valid, display a snackbar. In the real world,
          // you'd often call a server or save the information in a database.
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Processing Data")),
          );
        }
        print(passwordController.text);
        print(emailController.text);
        var email = emailController.text;
        var password = passwordController.text;
        users['$email'] = '$password';
        print(users);
      },
      // ignore: prefer_const_constructors
      child: Center(
        widthFactor: 8,
        child: const Text('Submit'),
      ),
    );
  }
}

var users = Map<String, String>();
final emailController = TextEditingController();
// var email = emailController.text;
final passwordController = TextEditingController();
// var password = passwordController.text;
