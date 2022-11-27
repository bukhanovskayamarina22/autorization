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
    await box.put('${user['email']}', user);
    return true;
  }

  Future userExists({required Box box, required Map user}) async {
    if (await box.get(user['email']).toString() == user.toString()) {
      return true;
    }
    return false;
  }

  Future emailExists({required Box box, required String email}) async {
    if (await box.get(email) != null) {
      return true;
    } else {
      return false;
    }
  }

  Future updateUserData({required Box box, required Map user, required String parameterToUpdate, required newParameterValue}) async {
    if(await emailExists(box: box, email: user['email']) != false) {
      if(user.containsKey(parameterToUpdate) != false) {
        user[parameterToUpdate] = newParameterValue;
        box.put(user['email'], user);
        return 'value of $parameterToUpdate parameter now equals to $newParameterValue';
      } return 'no such parameter';
    }
    return 'user does not exist';
  }

  Future deleteUser({required Box box, required String email}) async {
    if (await emailExists(box: box, email: email) != false) {
      box.delete(email);
      return 'deleted';
    }
    return 'no such user in the box';
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
