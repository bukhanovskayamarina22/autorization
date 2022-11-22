import 'package:flutter/material.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'package:autorization/custom_icons_icons.dart';
import 'db_test.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'db_test.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Validation Demo';
    sqfliteFfiInit();

    var databaseFactory = databaseFactoryFfi;
    var db = databaseFactory.openDatabase(inMemoryDatabasePath);
    db.execute('''
    CREATE TABLE Users (
        id INTEGER PRIMARY KEY,
        email TEXT,
        password TEXT
    )
    ''');

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const Center(
          child: MyCustomForm(),
        ),
        floatingActionButton: SettingButton(),
      ),
    );
  }
}

class SettingButton extends StatelessWidget {
  const SettingButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
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

class AppleAuth extends StatelessWidget {
  const AppleAuth({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: OutlinedButton(onPressed: () {}, child: const Text('Apple ID')),
    );
  }
}

class GoogleAuth extends StatelessWidget {
  const GoogleAuth({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: OutlinedButton(onPressed: () {}, child: const Text('Google')),
    );
  }
}

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
<<<<<<< Updated upstream
      onPressed: () async {
        var user = User(email: emailController.text, password: passwordController.text);
=======
      onPressed: () {
        var user = User(email: UsernameField, password: PasswordField);
        user.addNewUserIntoTable(database: db, tableName: Users, email: user.email, password: user.password);
>>>>>>> Stashed changes
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
        child: const Text('Submit'),
      ),
    );
  }
}
final emailController = TextEditingController();
final passwordController = TextEditingController();
class PasswordField extends StatelessWidget {
  const PasswordField({
    Key? key,
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
    );
  }
}

class UsernameField extends StatelessWidget {
  const UsernameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: emailController,
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

    );
  }
}


class User {
  var email;
  var password;
  User({required email, required password}) {
<<<<<<< Updated upstream
    this.email = email;
    this.password = password;
  }

  // Future<int> addNewUserIntoTable({required database, required String tableName, required String email, required String password}) {
  //   var  database.insert(tableName, <String, String>{'email': '$email', 'password': '$password'});
  // }
=======
    email = this.email;
    password = this.password;
  }

  Future<int> addNewUserIntoTable({required Database database, required String tableName, required String email, required     String password}) {
  return database.insert(tableName, <String, String>{'email': '$email', 'password': '$password'});
}
>>>>>>> Stashed changes
}


