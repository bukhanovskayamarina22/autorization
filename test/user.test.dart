import 'package:autorization/src/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:autorization/main.dart';

void main() {
  test("toMap in user check", () {
    var email = "test@gmail.com";
    var password = "asdasdasd";
    User testUser = User(email: email, password: password);

    var toMap = testUser.toMap();

    Map<String, dynamic> toMapOut = {'email': email, 'password': password};
    expect(toMap, toMapOut);
  });

  test("toString in user check", () {
    var email = "test@gmail.com";
    var password = "asdasdasd";
    User testUser = User(email: email, password: password);

    var toString = testUser.toString();
    print(toString);
    String toStirngOut = 'email: ${email}, password: ${password}';
    print(toStirngOut);
    expect(toString, toStirngOut);
  });
}
