class User {
  var email;
  var password;
  User({required email, required password}) {
    this.email = email;
    this.password = password;
  }

  Map<String, dynamic> toMap() => {'email': this.email, 'password': this.password};

  @override
  String toString() => 'email: ${this.email}, password: ${this.password}';
}