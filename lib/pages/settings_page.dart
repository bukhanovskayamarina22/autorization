import 'package:autorization/widgets/toggle_button_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:autorization/widgets/toggle_button_language.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.pageSettingsTitle),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.fromLTRB(65, 20, 0, 0),
        child: Column(children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const TextLanguage(),
              // ignore: prefer_const_constructors
              const Flexible(child: ToggleButtonLanguage()),
            ],
          ),
          // ignore: prefer_const_constructors
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: SizedBox(
                  width: 100,
                  height: 40,
                  child: FittedBox(
                    child: Text(
                      AppLocalizations.of(context)!.pageSettingsTextTheme,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Flexible(child: ToggleButtonTheme())
            ],
          )
        ]),
      ),
    );
  }
}

class TextLanguage extends StatelessWidget {
  const TextLanguage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
          width: 100,
          height: 40,
          child: FittedBox(
              child: Text(
            AppLocalizations.of(context)!.pageSettingsTextLanguage,
            textAlign: TextAlign.center,
            selectionColor: Theme.of(context).iconTheme.color,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ))),
    );
  }
}
