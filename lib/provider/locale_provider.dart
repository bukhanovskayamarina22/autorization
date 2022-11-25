import 'package:flutter/widgets.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = Locale('en', '');
  List<String> language_for_locale = ["ru", "en", "cs"];
  List<String> language = ["Rus", "Eng", "Cze"];

  List<bool> SelectLocale() {
    List<bool> isSelected = [false, false, false];
    var localeProvaider = _locale;
    for (int index = 0; index < isSelected.length; index++) {
      if (locale.languageCode == language_for_locale[index]) {
        isSelected[index] = true;
      } else {
        isSelected[index] = false;
      }
    }
    return isSelected;
  }

  LocaleProvider(Locale value) {
    _locale = value;
  }

  Locale get locale => _locale;

  void setLocale(Locale value) {
    _locale = value;
    notifyListeners();
  }
}
