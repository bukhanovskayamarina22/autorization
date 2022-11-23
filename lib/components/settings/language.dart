import 'package:flutter/material.dart';

class Language extends StatefulWidget {
  const Language({
    Key? key,
  }) : super(key: key);

  @override
  _LanguageList createState() => _LanguageList();
}

class _LanguageList extends State<Language> {
  final List<String> language = ["Rus", "Eng", "Сze"];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ignore: prefer_const_constructors
          Text(
            'Language',
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: language.length,
            itemBuilder: _createListView,
          ))
        ]);
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
        padding: EdgeInsets.symmetric(vertical: 2),
        color: index == selectedIndex ? Colors.black12 : Colors.white60,
        child: Text(language[index], style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
