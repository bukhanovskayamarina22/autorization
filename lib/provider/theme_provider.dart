import 'package:flutter/material.dart';
import 'package:path/path.dart';

class ThemeProvider extends ChangeNotifier {
  //For new theme need add to enum in system file
  //C:\src\flutter\packages\flutter\lib\src\material\app.dart

  ThemeMode _themeMode = ThemeMode.light;
  List<ThemeMode> themes = [ThemeMode.system, ThemeMode.dark, ThemeMode.light];

  List<bool> SelectThemeNow() {
    List<bool> isSelected = [false, false, false];
    var themeMode = _themeMode;
    for (int index = 0; index < isSelected.length; index++) {
      if (themeMode == themes[index]) {
        isSelected[index] = true;
      } else {
        isSelected[index] = false;
      }
    }
    return isSelected;
  }

  ThemeMode get themeMode => _themeMode;

  void setTheme(ThemeMode value) {
    _themeMode = value;
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
    toggleButtonsTheme: ToggleButtonsThemeData(
        selectedColor: Colors.black,
        color: Colors.white,
        fillColor: Color.fromRGBO(187, 134, 252, 1)),
  );

  static final lightTheme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.white,
      colorScheme: ColorScheme.light(),
      iconTheme: IconThemeData(color: Colors.red, opacity: 0.8),
      toggleButtonsTheme: ToggleButtonsThemeData(
        selectedColor: Colors.white,
        color: Colors.black,
        fillColor: Color.fromRGBO(98, 0, 238, 1),
      ));
}
