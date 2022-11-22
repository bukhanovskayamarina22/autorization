class User {
  var email;
  var password;
  User({required email, required password}) {
    this.email = email;
    this.password = password;
  }

  // Future<int> addNewUserIntoTable({required database, required String tableName, required String email, required String password}) {
  //   var  database.insert(tableName, <String, String>{'email': '$email', 'password': '$password'});
  // }

}
