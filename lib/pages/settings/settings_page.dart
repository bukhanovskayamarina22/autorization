import 'package:autorization/src/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:autorization/constants/language_class.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  SettingsPageState createState() {
    return SettingsPageState();
  }
}

class SettingsPageState extends State<SettingsPage> {
  final List<String> language = ["Rus", "Eng", "Сze"];
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Container(
          width: 400,
          height: 100,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Language',
                textAlign: TextAlign.center,
                selectionColor: Colors.blue,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Flexible(
                  child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: language.length,
                itemBuilder: _createListView,
              )),
            ],
          )),
    );
  }

  Widget _createListView(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // устанавливаем индекс выделенного элемента
          selectedIndex = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20),
        width: 40,
        color: index == selectedIndex ? Colors.black12 : Colors.white60,
        child: Text(language[index], style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
