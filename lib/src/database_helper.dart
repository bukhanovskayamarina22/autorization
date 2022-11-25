import 'dart:core';

// import 'package:autorization/flutter_app.dart';
import 'package:autorization/src/user.dart';
import 'package:hive_flutter/adapters.dart';

class DatabaseHelper {
  //empty constructor
  DatabaseHelper();

  Future openDatabase() async {
    return await Hive.openBox<Map>('users');
  }

  Future openBox() async {
    return await Hive.box<Map>('users');
  }

  Future addUser({required Box box, required User user}) async {
    Map userMap = user.toMap();
    box.put('${user.email}', userMap);
  }

  Future userExists({required Box box, required User user}) async {
    Map userMap = user.toMap();
    if (box.get('${user.email}') != null) return '${user.password}';
    return "no such user";
  }
}

Future<void> startBase() async {
  await Hive.initFlutter();

  var databaseHelper = await DatabaseHelper();

  var opendb = await databaseHelper.openDatabase();
  var openBox = await databaseHelper.openBox();

  // var user1 = User(email: 'user1@gmail.com', password: 'password1');
  // var user2 = User(email: 'user2@gmail.com', password: 'password2');

  //unit tests (almost)

  //var addedUser = await databaseHelper.addUser(box: openBox, user: user2);
  // print('added user: $user1');

  // print('------getting users:');
  // print('------user exists, password:');
  // var existingUser = await databaseHelper.userExists(box: openBox, user: user1);
  // print(existingUser);
  // print('------user doesn\'t exist:');
  // var nonExistingUser =
  //     await databaseHelper.userExists(box: openBox, user: user2);
  // print(nonExistingUser);
}


// void main() async {
//   //starting and opening the database
//   await Hive.initFlutter();

//   var databaseHelper = await DatabaseHelper();

//   var opendb = await databaseHelper.openDatabase();
//   var openBox = await databaseHelper.openBox();

//   //test data

//   var user1 = User(email: 'user1@gmail.com', password: 'password1');
//   var user2 = User(email: 'user2@gmail.com', password: 'password2');

//   //unit tests (almost)

//   var addedUser = await databaseHelper.addUser(box: openBox, user: user1);
//   print('added user: $user1');

//   print('------getting users:');
//   print('------user exists, password:');
//   var existingUser = await databaseHelper.userExists(box: openBox, user: user1);
//   print(existingUser);
//   print('------user doesn\'t exist:');
//   var nonExistingUser =
//       await databaseHelper.userExists(box: openBox, user: user2);
//   print(nonExistingUser);
// }
