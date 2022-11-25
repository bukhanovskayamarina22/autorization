import 'package:autorization/main.dart';
import 'package:autorization/provider/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:autorization/src/SelectLanguage.dart';

class ToggleButtons1 extends StatefulWidget {
  @override
  _ToggleButtons1State createState() => _ToggleButtons1State();
}

class _ToggleButtons1State extends State<ToggleButtons1> {
  final List<String> language_for_locale = ["ru", "en", "cs"];
  final List<String> language = ["Rus", "Eng", "Cze"];
  List<bool> isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) => Container(
        color: Theme.of(context).iconTheme.color,
        child: ToggleButtons(
          isSelected: isSelected,
          selectedColor: Colors.white,
          color: Colors.black,
          fillColor: Colors.purple.shade900,
          renderBorder: false,
          //splashColor: Colors.red,
          highlightColor: Colors.orange,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(language[0], style: TextStyle(fontSize: 18)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(language[1], style: TextStyle(fontSize: 18)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(language[2], style: TextStyle(fontSize: 18)),
            ),
          ],
          onPressed: (int newIndex) {
            setState(() {
              final locale =
                  Provider.of<LocaleProvider>(context, listen: false);
              for (int index = 0; index < isSelected.length; index++) {
                if (index == newIndex) {
                  isSelected[index] = true;
                  locale.setLocale(Locale.fromSubtags(
                      languageCode: language_for_locale[index]));
                } else {
                  isSelected[index] = false;
                }
              }
            });
          },
        ),
      );

  void SelectLocale(BuildContext context, List<bool> isSelected,
      List<String> language) async {
    var localeProvaider = Provider.of<LocaleProvider>(context);
    for (int index = 0; index < isSelected.length; index++) {
      if (localeProvaider.locale.languageCode == language[index]) {
        isSelected[index] = true;
      } else {
        isSelected[index] = false;
      }
    }
  }
}
