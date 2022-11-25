import 'package:autorization/src/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../lib/src/db/database_helper.dart';

void main() {
  test('adds new User to database', () async {
    var user = User(email: 'johndoe@gmail.com', password: 'password');
    await Hive.initFlutter();
    var databaseHelper = await DatabaseHelper();
    var opendb = await databaseHelper.openUserBox();
    var openBox = await databaseHelper.getUserBox();
    
    databaseHelper.addUser(box: openBox, user: user);

    expect(openBox.get('${user.email}'), {'email': '${user.email}', 'password': '${user.password}'});
  });

  test('checks if user exists in database by email', () async {
    var user = User(email: 'name@example.com', password: 'asdfasdf');
    await Hive.initFlutter();
    var databaseHelper = await DatabaseHelper();
    var openBox = await databaseHelper.getUserBox();

    var r = await databaseHelper.userExists(box: openBox, user: user);

    expect(r, '${user.password}');
  });

    test('checks if user exists in database by email', () async {
    var user = User(email: 'nam@example.com', password: 'asdfasdf');
    await Hive.initFlutter();
    var databaseHelper = await DatabaseHelper();
    var opendb = await databaseHelper.openUserBox();
    var openBox = await databaseHelper.getUserBox();

    var r = await databaseHelper.userExists(box: openBox, user: user);

    expect(r, 'no such user');
  });

  test('auto increment box.add', () async {
    var token = 'a';
    await Hive.initFlutter();
    var databaseHelper = await DatabaseHelper();
    var createBox = await databaseHelper.openGoogleBox();
    var openBox = await databaseHelper.getGoogleBox();

    databaseHelper.addGoogleToken(box: openBox, token: token);

    expect(openBox.get(0), token);
  });

  test('box "users" is opened because it already exists', () async {
    await Hive.initFlutter();
    var databaseHelper = await DatabaseHelper();
    var openBox = await databaseHelper.openGoogleBox();

    var r = openBox.isOpen;

    expect(r, true);
  });

  test('box "users" is not null', () async {
    await Hive.initFlutter();
    var databaseHelper = await DatabaseHelper();
    var openBox = await databaseHelper.getGoogleBox();

    var r = openBox.isOpen;

    expect(r, true);
  });

  test('newly created box is empty', () async {
    await Hive.initFlutter();
    Box newBox = await Hive.openBox('name');

    var r = newBox.isEmpty;

    expect(r, true);
  });

  test('existing box is not empty', () async {
    await Hive.initFlutter();
    var databaseHelper = await DatabaseHelper();
    Box opendb = await databaseHelper.openUserBox();

    var r = opendb.isNotEmpty;

    expect(r, true);
  });
}