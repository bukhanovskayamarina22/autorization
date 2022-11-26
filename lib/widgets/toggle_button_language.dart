import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:autorization/provider/locale_provider.dart';

class ToggleButtonLanguage extends StatefulWidget {
  const ToggleButtonLanguage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ToggleButtonLanguageState createState() => _ToggleButtonLanguageState();
}

class _ToggleButtonLanguageState extends State<ToggleButtonLanguage> {
  @override
  Widget build(BuildContext context) {
    final locale = Provider.of<LocaleProvider>(context);
    final List<String> languageForLocale = locale.languageForLocale;
    final List<String> language = locale.language;
    List<bool> isSelected = locale.SelectLocale();
    print(isSelected);

    return ToggleButtons(
      isSelected: isSelected,
      selectedColor: Theme.of(context).toggleButtonsTheme.selectedColor,
      color: Theme.of(context).toggleButtonsTheme.color,
      fillColor: Theme.of(context).toggleButtonsTheme.fillColor,
      renderBorder: false,
      //splashColor: Colors.red,
      //highlightColor: Colors.orange,
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
          print(newIndex);
          final locale = Provider.of<LocaleProvider>(context, listen: false);
          for (int index = 0; index < isSelected.length; index++) {
            if (index == newIndex) {
              isSelected[index] = true;
              locale.setLocale(
                  Locale.fromSubtags(languageCode: languageForLocale[index]));
            } else {
              isSelected[index] = false;
            }
          }
        });
      },
    );
  }
}
