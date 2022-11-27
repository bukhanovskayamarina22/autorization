import 'dart:convert';

class GoogleUser {
  var responceBody;
  GoogleUser({required this.responceBody});

  Map<String, dynamic> toMap() => jsonDecode(responceBody);
}