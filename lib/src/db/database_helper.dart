
import 'dart:core';

import 'package:hive_flutter/adapters.dart';


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
    return await Hive.openBox('google-users');
  }

  Future getGoogleBox() async {
    return await Hive.box('google-users');
  }

  Future addUser({required Box box,required String encryptedEmail, required String encryptedUser}) async {
    await box.put(encryptedEmail, encryptedUser);
    return true;
  }

  Future userExists({required Box box, required String encryptedEmail, required String encryptedUser}) async {
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

