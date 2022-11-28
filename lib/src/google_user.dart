import 'dart:convert';

class GoogleUser {
  var responseBody;
  GoogleUser({required this.responseBody});

  Map<String, dynamic> toMap() => jsonDecode(responseBody);
}