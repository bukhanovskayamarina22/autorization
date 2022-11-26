import 'package:autorization/widgets/toggle_button_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:autorization/components/settings/confirm_button.dart';
import 'package:autorization/widgets/toggle_button_language.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() {
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.pageSettingsTitle),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
            width: 500,
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
            alignment: Alignment.center,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
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
                    const TextTheme(),
                    const Flexible(child: ToggleButtonTheme())
                  ],
                )
              ]),
            )),
      ),
      floatingActionButton: const Align(
        alignment: Alignment.bottomCenter,
        child: ConfirmButton(),
      ),
    );
  }
}

class TextTheme extends StatelessWidget {
  const TextTheme({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Flexible(
          child: SizedBox(
              width: 100,
              height: 40,
              child: FittedBox(
                  child: Text(
                AppLocalizations.of(context)!.pageSettingsTextDarkTheme,
                textAlign: TextAlign.center,
                selectionColor: Colors.blue,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )))),
    );
  }
}

class TextLanguage extends StatelessWidget {
  const TextLanguage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: Flexible(
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
      ),
    );
  }
}
