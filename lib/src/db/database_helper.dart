// ignore_for_file: await_only_futures

import 'dart:core';

import 'package:hive_flutter/adapters.dart';

import 'package:autorization/src/user.dart';

class DatabaseHelper {
  //empty constructor
  DatabaseHelper();

  Future openUserBox() async {
    return await Hive.openBox<Map>('users');
  }

  Future getUserBox() async {
    return await Hive.box<Map>('users');
  }

  Future openGoogleBox() async {
    return await Hive.openBox('google-tokens');
  }

  Future getGoogleBox() async {
    return await Hive.box('google-tokens');
  }

  Future addUser({required Box box, required Map user}) async {
    box.put('${user['email']}', user);
  }

  Future userExists({required Box box, required Map user}) async {
    if (box.get(user['email']) == user) {
      return true;
    }
    return false;
  }

  Future emailExists({required Box box, required String email}) async {
    if (box.get(email) != null) {
      return true;
    } else {
      return false;
    }
  }


}

Future startBase() async {
  await Hive.initFlutter();
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
