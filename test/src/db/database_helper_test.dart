import 'package:autorization/src/db/database_helper.dart';
import 'package:autorization/src/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() {
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

  test('if email key is not in the box false returned', () async {
    var user = User(email: 'asdf', password: 'asdf');
    await Hive.initFlutter();
    var databaseHelper = await DatabaseHelper();
    var opendb = await databaseHelper.openUserBox();
    Box openBox = await databaseHelper.getUserBox();

    var r = await databaseHelper.emailExists(box: openBox, email: user.email);

    expect(r, false);
  });

  test('if email key is in the box true returned', () async {
    var user = User(email: 'name@example.com', password: 'asdfasdf');
    await Hive.initFlutter();
    var databaseHelper = await DatabaseHelper();
    var opendb = await databaseHelper.openUserBox();
    Box openBox = await databaseHelper.getUserBox();

    var r = await databaseHelper.emailExists(box: openBox, email: user.email);

    expect(r, true);
  });
}
