import 'dart:convert';

import 'package:autorization/src/google_user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('toMap returns json', () async {
    var responseMap = {
      "id": "110703514124721531255",
      "email": "bukhanovskayamarina@gmail.com",
      "verified_email": true,
      "picture": "https://lh3.googleusercontent.com/a/default-user=s96-c"
    };
    var response = jsonEncode({
      "id": "110703514124721531255",
      "email": "bukhanovskayamarina@gmail.com",
      "verified_email": true,
      "picture": "https://lh3.googleusercontent.com/a/default-user=s96-c"
    });
  
    var googleUser = GoogleUser(responseBody: response);

    var r = googleUser.toMap();

    expect(r, responseMap);
  });
}