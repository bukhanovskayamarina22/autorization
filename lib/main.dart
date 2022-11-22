import 'package:flutter/material.dart';
import 'package:autorization/custom_icons_icons.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const Center(
          child: MyCustomForm(),
        ),
        floatingActionButton: Align(
          alignment: Alignment.bottomRight,
          child: IconButton(
            // ignore: prefer_const_constructors
            icon: Icon(
              CustomIcons.settings,
            ),
            iconSize: 20.0,
            color: Colors.grey[900],
            onPressed: () {
              print("Button has been pressed");
            },
          ),
        ),
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
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 100),
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("username"),
                hintText: "email",
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
            ),
            const Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
            ),
            TextFormField(
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
                return null;
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: Center(
                child: const Text('Submit'),
                widthFactor: 8,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
            ),
            Column(
              children: [
                // Full width button 2
                Container(
                  width: double.infinity,
                  color: Colors.transparent,
                  child: OutlinedButton(
                      onPressed: () {}, child: const Text('Google')),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  color: Colors.transparent,
                  child: OutlinedButton(
                      onPressed: () {}, child: const Text('Apple ID')),
                ),
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
}
