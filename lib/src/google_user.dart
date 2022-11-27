import 'dart:convert';

class GoogleUser {
  var id;
  var email;
  var email_verified;
  var picture;
  var responceBody;
  GoogleUser({required this.responceBody});

  Map<String, dynamic> toMap() => jsonDecode(responceBody);
}