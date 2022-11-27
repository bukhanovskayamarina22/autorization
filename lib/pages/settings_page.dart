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
        title: Text(AppLocalizations.of(context)!.pageSettingsTitle,
            key: const Key("AppBar Text")),
      ),
      body: BodySettingsPage(),
    );
  }
}

class BodySettingsPage extends StatelessWidget {
  const BodySettingsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key("Conteiner for body SettingsPage"),
      alignment: Alignment.topCenter,
      margin: EdgeInsets.fromLTRB(65, 20, 0, 0),
      child: Column(key: const Key("Column Settings"), children: [
        LanguageSettings(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
        ),
        ThemeSettings()
      ]),
    );
  }
}

class LanguageSettings extends StatelessWidget {
  const LanguageSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      key: const Key("Row for Languages"),
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const TextLanguage(),
        const Flexible(child: ToggleButtonLanguage()),
      ],
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
            key: Key("Field for TextLanguage"),
            textAlign: TextAlign.center,
            selectionColor: Theme.of(context).iconTheme.color,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ))),
    );
  }
}

class ThemeSettings extends StatelessWidget {
  const ThemeSettings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      key: Key("Row for themes"),
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [ThemeText(), Flexible(child: ToggleButtonTheme())],
    );
  }
}

class ThemeText extends StatelessWidget {
  const ThemeText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: SizedBox(
        width: 100,
        height: 40,
        child: FittedBox(
          child: Text(
            AppLocalizations.of(context)!.pageSettingsTextTheme,
            key: const Key("Field for TextTheme"),
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
