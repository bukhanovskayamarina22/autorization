import 'package:autorization/components/settings/confirm_button.dart';
import 'package:autorization/constants/controllers.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() {
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  final List<String> language = ["Rus", "Eng", "Сze"];
  int selectedIndex = language_now.number_language;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(language_now.settings),
      ),
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
            width: 500,
            height: 100,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Text language
                Flexible(
                  child: Container(
                      width: 100,
                      height: 40,
                      child: FittedBox(
                          child: Text(
                        language_now.language,
                        textAlign: TextAlign.center,
                        selectionColor: Colors.blue,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ))),
                ),
                //Buttons for language
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
            )),
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
          language_now.number_language = index;
          language_now.change_language(language_now.number_language);
          print(language_now.confirm);
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20),
        color: index == language_now.number_language
            ? Colors.black12
            : Colors.white60,
        child: Text(language[index], style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
