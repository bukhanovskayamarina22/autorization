import 'package:flutter/material.dart';

class PasswordProvider extends ChangeNotifier {
  String password = "";

  @override
  void notifyListeners();
}