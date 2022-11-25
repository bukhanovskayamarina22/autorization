import 'package:autorization/provider/locale_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

void SelectLanguage(
    BuildContext context, List<bool> isSelected, List<String> language) {
  var localeProvaider = Provider.of<LocaleProvider>(context);
  for (int index = 0; index < isSelected.length; index++) {
    if (localeProvaider.locale.languageCode == language[index]) {
      isSelected[index] = true;
    } else {
      isSelected[index] = false;
    }
  }
}
