class User {
  var email;
  var password;
  User({
    required this.email, 
    required this.password});

  Map<String, dynamic> toMap() =>
      {'email': email, 'password': password};

  @override
  String toString() => 'email: $email, password: $password';
}
