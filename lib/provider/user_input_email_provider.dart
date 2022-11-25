import 'package:flutter/material.dart';

class UsernameProvider extends ChangeNotifier {

  String value = "";

  String get email => value;

  set name (String email) {
    value = email;
    notifyListeners();
  }
}