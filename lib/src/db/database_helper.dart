// ignore_for_file: await_only_futures

import 'dart:core';

import 'package:hive_flutter/adapters.dart';

import 'package:autorization/src/user.dart';

class DatabaseHelper {
  //empty constructor
  DatabaseHelper();

  Future openUserBox() async {
    return await Hive.openBox('users');
  }

  Future getUserBox() async {
    return await Hive.box('users');
  }

  Future openGoogleBox() async {
    return await Hive.openBox('google-tokens');
  }

  Future getGoogleBox() async {
    return await Hive.box('google-tokens');
  }

  Future addUser({required Box box,required String encryptedEmail, required String encryptedUser}) async {
    await box.put(encryptedEmail, encryptedUser);
    return true;
  }

  Future userExists({required Box box,required String encryptedEmail, required String encryptedUser}) async {
    if (await box.get(encryptedEmail) == encryptedUser) {
      return true;
    }
    return false;
  }

  Future emailExists({required Box box, required String encryptedEmail}) async {
    if (await box.get(encryptedEmail) != null) {
      return true;
    } else {
      return false;
    }
  }

  Future updateUserData({required Box box, required String encryptedEmail, required String encryptedUpdatedUser}) async {
    if(await emailExists(box: box, encryptedEmail: encryptedEmail) != false) {
        box.put(encryptedEmail, encryptedUpdatedUser);
        return 'updated';
      }      
    return 'user does not exist'; 
  }

  Future deleteUser({required Box box, required String encryptedEmail}) async {
    if(await emailExists(box: box, encryptedEmail: encryptedEmail) != false) {
      box.delete(encryptedEmail);
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
