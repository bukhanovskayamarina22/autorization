import 'package:autorization/components/settings/confirm_button.dart';
import 'package:autorization/main.dart';
import 'package:autorization/widgets/change_theme_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() {
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  final List<String> language_for_locale = ["ru", "en", "cs"];
  final List<String> language = ["Rus", "Eng", "Cze"];
  int selectedIndex = -1;

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
            height: 100,
            alignment: Alignment.center,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Text language
                  TextLanguage(),
                  //Поменять на toggle_button
                  Flexible(
                      child: Container(
                          width: 400,
                          height: 40,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: language.length,
                            itemBuilder: _createListView,
                          ))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                      child: Container(
                          width: 100,
                          height: 40,
                          child: FittedBox(
                              child: Text(
                            "Dark Theme",
                            textAlign: TextAlign.center,
                            selectionColor: Colors.blue,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          )))),
                  Flexible(child: ChangeThemeButtonWidget())
                ],
              )
            ])),
      ),
      floatingActionButton: const Align(
        alignment: Alignment.bottomCenter,
        child: ConfirmButton(),
      ),
    );
  }

  Widget _createListView(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // устанавливаем индекс выделенного элемента
          selectedIndex = index;
        });
        MyApp.of(context)?.setLocale(
            Locale.fromSubtags(languageCode: language_for_locale[index]));
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20),
        color: index == selectedIndex ? Colors.black12 : Colors.white60,
        child: Text(language[index], style: TextStyle(fontSize: 20)),
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

