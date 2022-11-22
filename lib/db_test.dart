import 'package:sqflite_common/sqlite_api.dart';
<<<<<<< Updated upstream
import 'package:sqflite_common_ffi/sqflite_ffi.dart';                           

void main() async {
=======
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

Future createDatabase() async {
>>>>>>> Stashed changes
  // Init ffi loader if needed.
  sqfliteFfiInit();

  var databaseFactory = databaseFactoryFfi;
  var db = await databaseFactory.openDatabase(inMemoryDatabasePath);
  await db.execute('''
  CREATE TABLE Users (
      id INTEGER PRIMARY KEY,
      email TEXT,
      password TEXT
  )
  ''');
  await db.insert('Users', <String, Object?>{'email': 'example1@gmail.com', 'password': 'password1'});
  await db.insert('Users', <String, Object?>{'email': 'example2@gmail.com', 'password': 'password2'});
<<<<<<< Updated upstream
  print("query");
  var result = await db.query('Users');
  print(result);
  print("------------------------------------");
  print("select");
  var user1 = await db.rawQuery('SELECT * FROM Users WHERE email=?', ['example1@gmail.com']);
  print(user1);
  result = await db.query('Users');
  print(result);
  print("------------------------------------");
  print("delete");
  var deletedUser = await db.rawDelete('DELETE FROM Users WHERE email=?', ['example1@gmail.com']);
  print(deletedUser);
  result = await db.query('Users');
  print(result);
  print("------------------------------------");
  print("update");
  var changePassword = await db.rawUpdate('UPDATE Users SET password = ? WHERE email = ?',
  ['password3', 'example2@gmail.com']);
  print(changePassword);
  result = await db.query('Users');
  print(result);
  print("------------------------------------");
  print("add new using function");
  var funcTest = await addNewUserIntoTable(database: db, tableName: 'Users', email: 'example1@gmail.com', password: 'password1');
  print(funcTest);
  result = await db.query('Users');
  print(result);
  print("------------------------------------");

  db.close();

}

  Future<int> addNewUserIntoTable({required database, required String tableName, required String email, required String password}) {
    return  database.insert(tableName, <String, String>{'email': '$email', 'password': '$password'});
  }

// Future createDatabase() async {
//   // Init ffi loader if needed.
//   sqfliteFfiInit();

//   var databaseFactory = databaseFactoryFfi;
//   var db = await databaseFactory.openDatabase(inMemoryDatabasePath);
//   await db.execute('''
//   CREATE TABLE Users (
//       id INTEGER PRIMARY KEY,
//       email TEXT,
//       password TEXT
//   )
//   ''');
//   await db.insert('Users', <String, Object?>{'email': 'example1@gmail.com', 'password': 'password1'});
//   await db.insert('Users', <String, Object?>{'email': 'example2@gmail.com', 'password': 'password2'});

//   // var result = await db.query('Users');

//   // var user1 = await db.rawQuery('SELECT * FROM Users WHERE email=?', ['example1@gmail.com']);

//   // var deletedUser = await db.rawDelete('DELETE FROM Users WHERE email=?', ['example1@gmail.com']);

//   // var changePassword = await db.rawUpdate('UPDATE Users SET password = ? WHERE email = ?',
//   // ['password3', 'example2@gmail.com']);

//   // var funcTest = await addNewUserIntoTable(database: db, tableName: 'Users', email: 'example1@gmail.com', password: 'password1');
//   return db;
// }

// //adds new user into table, returns id of the last inserted row. 


// //gets row by email
// Object? getUserByEmail ({required Database database, required String tableName, required String email}) {
//   return database.rawQuery('SELECT * FROM $tableName WHERE email=?', ['$email']);
// } 


// Database? newDB() {
//   Future createDatabase() async {
//   // Init ffi loader if needed.
//   sqfliteFfiInit();

//   var databaseFactory = databaseFactoryFfi;
//   var db = await databaseFactory.openDatabase(inMemoryDatabasePath);
//   await db.execute('''
//   CREATE TABLE Users (
//       id INTEGER PRIMARY KEY,
//       email TEXT,
//       password TEXT
//   )
//   ''');
//   await db.insert('Users', <String, Object?>{'email': 'example1@gmail.com', 'password': 'password1'});
//   await db.insert('Users', <String, Object?>{'email': 'example2@gmail.com', 'password': 'password2'});

//   // var result = await db.query('Users');

//   // var user1 = await db.rawQuery('SELECT * FROM Users WHERE email=?', ['example1@gmail.com']);

//   // var deletedUser = await db.rawDelete('DELETE FROM Users WHERE email=?', ['example1@gmail.com']);

//   // var changePassword = await db.rawUpdate('UPDATE Users SET password = ? WHERE email = ?',
//   // ['password3', 'example2@gmail.com']);

//   // var funcTest = await addNewUserIntoTable(database: db, tableName: 'Users', email: 'example1@gmail.com', password: 'password1');
//   }
// }


=======

  var result = await db.query('Users');

  var user1 = await db.rawQuery('SELECT * FROM Users WHERE email=?', ['example1@gmail.com']);

  var deletedUser = await db.rawDelete('DELETE FROM Users WHERE email=?', ['example1@gmail.com']);

  var changePassword = await db.rawUpdate('UPDATE Users SET password = ? WHERE email = ?',
  ['password3', 'example2@gmail.com']);

  // var funcTest = await addNewUserIntoTable(database: db, tableName: 'Users', email: 'example1@gmail.com', password: 'password1');

  await db.close();
}

//adds new user into table, returns id of the last inserted row. 


//gets row by email
Object? getUserByEmail ({required Database database, required String tableName, required String email}) {
  return database.rawQuery('SELECT * FROM $tableName WHERE email=?', ['$email']);
} 
>>>>>>> Stashed changes
