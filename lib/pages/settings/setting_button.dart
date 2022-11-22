import 'package:flutter/material.dart';
import '../../src/custom_icons.dart';
import 'language.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});
  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomRight,
        child: IconButton(
            onPressed: () {
              showSettings(context);
            },
            icon: Icon(CustomIcons.settings)));
  }
}

Future showSettings(BuildContext context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actions: <Widget>[SettingMenu()],
        );
      });
}

class SettingMenu extends StatelessWidget {
  const SettingMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(width: 100, height: 120, child: Language());
  }
}
