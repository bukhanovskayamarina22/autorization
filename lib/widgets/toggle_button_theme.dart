import 'package:autorization/provider/theme_provider_new.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    final List<String> themesText = themeProvider.themesText;
    List<bool> isSelected = themeProvider.SelectThemeNow();
    print(isSelected);

    return Container(
      color: Theme.of(context).iconTheme.color,
      child: ToggleButtons(
        isSelected: isSelected,
        selectedColor: Colors.white,
        color: Colors.black,
        fillColor: Colors.purple.shade900,
        renderBorder: false,
        splashColor: Colors.red,
        highlightColor: Colors.orange,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(themesText[0], style: TextStyle(fontSize: 18)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(themesText[1], style: TextStyle(fontSize: 18)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(themesText[2], style: TextStyle(fontSize: 18)),
          ),
        ],
        onPressed: (int newIndex) {
          setState(() {
            print(newIndex);
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
