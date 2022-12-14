import 'package:autorization/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ToggleButtonTheme extends StatefulWidget {
  const ToggleButtonTheme({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ToggleButtonThemeState createState() => _ToggleButtonThemeState();
}

class _ToggleButtonThemeState extends State<ToggleButtonTheme> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final List<ThemeMode> themes = themeProvider.themes;
    final List<String> themesText = [
      AppLocalizations.of(context)!.pageSettingsTextThemeSystem,
      AppLocalizations.of(context)!.pageSettingsTextThemeDark,
      AppLocalizations.of(context)!.pageSettingsTextThemeLight
    ];
    List<bool> isSelected = themeProvider.SelectThemeNow();

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: ToggleButtons(
        isSelected: isSelected,
        selectedColor: Theme.of(context).toggleButtonsTheme.selectedColor,
        color: Theme.of(context).toggleButtonsTheme.color,
        fillColor: Theme.of(context).toggleButtonsTheme.fillColor,
        renderBorder: false,
        // splashColor: Colors.red,
        highlightColor: Colors.orange,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(themesText[0],
                key: const Key("First child"), style: TextStyle(fontSize: 18)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(themesText[1],
                key: const Key("Second child"), style: TextStyle(fontSize: 18)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(themesText[2],
                key: const Key("Third child"), style: TextStyle(fontSize: 18)),
          ),
        ],
        onPressed: (int newIndex) {
          setState(() {
            final themeProvider =
                Provider.of<ThemeProvider>(context, listen: false);
            for (int index = 0; index < isSelected.length; index++) {
              if (index == newIndex) {
                isSelected[index] = true;
                themeProvider.setTheme(themes[index]);
              } else {
                isSelected[index] = false;
              }
            }
          });
        },
      ),
    );
  }
}
