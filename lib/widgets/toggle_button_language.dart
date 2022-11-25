import 'package:autorization/provider/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ToggleButtons1 extends StatefulWidget {
  const ToggleButtons1({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ToggleButtons1State createState() => _ToggleButtons1State();
}

class _ToggleButtons1State extends State<ToggleButtons1> {
  @override
  Widget build(BuildContext context) {
    final locale = Provider.of<LocaleProvider>(context);
    final List<String> language_for_locale = locale.language_for_locale;
    final List<String> language = locale.language;
    List<bool> isSelected = locale.SelectLocale(context);
    print(isSelected);

    return Container(
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
            print(newIndex);
            final locale = Provider.of<LocaleProvider>(context, listen: false);
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
  }
}
