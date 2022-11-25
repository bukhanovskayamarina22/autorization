import 'package:flutter/widgets.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = Locale('en', '');

  LocaleProvider(Locale value) {
    _locale = value;
  }

  Locale get locale => _locale;

  void setLocale(Locale value) {
    _locale = value;
    notifyListeners();
  }
}
