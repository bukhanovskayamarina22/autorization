import 'package:autorization/src/db/database_helper.dart';
import 'package:autorization/src/encryption.dart';
import 'package:autorization/src/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
    await Hive.initFlutter();
    DatabaseHelper databaseHelper = DatabaseHelper();

    Encryption encryption = Encryption();

  group('opening boxes', () {
    
    test('box "users" is opened because it already exists', () async {
      var openBox = await databaseHelper.openUserBox();

      var r = openBox.isOpen;

      expect(r, true);
    });

    test('box "google-users" is opened', () async {
      var getBox = await databaseHelper.openGoogleBox();
      var openBox = await databaseHelper.getGoogleBox();

      var r = openBox.isOpen;

      expect(r, true);
    });

    test('newly created box is empty', () async {
      Box newBox = await Hive.openBox('name');

      var r = newBox.isEmpty;

      expect(r, true);
    });

    test('existing box is not empty', () async {
      Box opendb = await databaseHelper.openUserBox();

      var r = opendb.isNotEmpty;

      expect(r, true);
    });
  });

  group('addUser', () {

    test('returns true if user successfuly added', () async {
      
      Box opendb = await databaseHelper.openUserBox();

      Map mapUser = User(email: 'email@email.com', password: 'password').toMap();
      String stringUser = User(email: 'email@email.com', password: 'password').toString();

      String encryptedUser = await encryption.encrypt(stringUser);
      String encryptedEmail = await encryption.encrypt(mapUser['email']);

      var r = await databaseHelper.addUser(box: opendb, encryptedEmail: encryptedEmail, encryptedUser: encryptedUser);

      expect(r, true);
    });

    test('user is now in database', () async {
      Box opendb = await databaseHelper.openUserBox();

      Map mapUser = User(email: 'email@email.com', password: 'password').toMap();
      String stringUser = User(email: 'email@email.com', password: 'password').toString();

      String encryptedUser = await encryption.encrypt(stringUser);
      String encryptedEmail = await encryption.encrypt(mapUser['email']);

      await databaseHelper.addUser(box: opendb, encryptedEmail: encryptedEmail, encryptedUser: encryptedUser);

      var r = await databaseHelper.emailExists(box: opendb, encryptedEmail: encryptedEmail);

      expect(r, true);
    });
  });
  
  group('userExists', () {

    test('returns true if the user with the given email exists in the box and they data matches with the value that has   been gotten by the email', () async {
      Box opendb = await databaseHelper.openUserBox();

      Map mapUser = User(email: 'email@email.com', password: 'password').toMap();
      String stringUser = User(email: 'email@email.com', password: 'password').toString();

      String encryptedUser = await encryption.encrypt(stringUser);
      String encryptedEmail = await encryption.encrypt(mapUser['email']);

      var r = await databaseHelper.userExists(box: opendb, encryptedEmail: encryptedEmail, encryptedUser: encryptedUser);

      expect(r, true);
    });

    test('returns false if user does not exist in database', () async {
      Box opendb = await databaseHelper.openUserBox();

      Map mapUser = User(email: 'asdf', password: 'password').toMap();
      String stringUser = User(email: 'asdf', password: 'password').toString();

      String encryptedUser = await encryption.encrypt(stringUser);
      String encryptedEmail = await encryption.encrypt(mapUser['email']);

      var r = await databaseHelper.userExists(box: opendb, encryptedEmail: encryptedEmail, encryptedUser: encryptedUser);

      expect(r, false);
    });
  });

  group('emailExists', () {

    test('returns true if there is a key that matches the email', () async {
      Box opendb = await databaseHelper.openUserBox();

      Map mapUser = User(email: 'email@email.com', password: 'password').toMap();

      String encryptedEmail = await encryption.encrypt(mapUser['email']);

      var r = await databaseHelper.emailExists(box: opendb, encryptedEmail: encryptedEmail);

      expect(r, true);
    });

    test('returns false if there isn\'t a key that matches the email', () async {
      Box opendb = await databaseHelper.openUserBox();

      Map mapUser = User(email: 'asdf', password: 'password').toMap();

      String encryptedEmail = await encryption.encrypt(mapUser['email']);

      var r = await databaseHelper.emailExists(box: opendb, encryptedEmail: encryptedEmail);

      expect(r, false);
    });
  });
  
  group('updateUserData', () {
    test('returns "updated" if the user data has been updated successfully', () async {
      Box opendb = await databaseHelper.openUserBox();

      Map mapUser = User(email: 'email@email.com', password: 'password').toMap();

      String encryptedUpdatedUser = User(email: 'email@email.com', password: 'password1').toString();
      String encryptedEmail = await encryption.encrypt(mapUser['email']);

      var r = await databaseHelper.updateUserData(box: opendb, encryptedEmail: encryptedEmail, encryptedUpdatedUser: encryptedUpdatedUser);

      expect(r, 'updated');
    });
  });

  group('deleteUser', () {
    //deleteUser
          //
    test('returns "deleted" if the user is no longer in database', () async {
      Box opendb = await databaseHelper.openUserBox();

      Map mapUser = User(email: 'email@email.com', password: 'password').toMap();
      String stringUser = User(email: 'email@email.com', password: 'password').toString();

      String encryptedUser = await encryption.encrypt(stringUser);
      String encryptedEmail = await encryption.encrypt(mapUser['email']);

      await databaseHelper.addUser(box: opendb, encryptedEmail: encryptedEmail, encryptedUser: encryptedUser);

      var r = await databaseHelper.deleteUser(box: opendb, encryptedEmail: encryptedEmail);

      expect(r, 'deleted');
    });
  });
}
