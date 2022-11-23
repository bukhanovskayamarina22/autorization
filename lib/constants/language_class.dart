class LanguageClass {
  static const String defaultLanguage = 'en';
  String username = 'username';
  String email = "email";
  String password = "password";
  String password_help = "at least 8 symbols";
  String submit = "Submit";
  String language = "Language";
  String settings = "Setting";
  String confirm = "Confirm";

  int number_language = 1;

  void change_language(x) {
    switch (x) {
      case 0:
        language_rus();
        print(email);
        break;
      case 1:
        language_eng();
        print(username);
        break;
      case 2:
        language_che();
        print(password_help);
        break;
      default:
        break;
    }
  }

  void language_rus() {
    username = "логин";
    email = "почта";
    password = "пароль";
    password_help = "не менее 8 символов";
    submit = "Отправить";
    language = "Язык";
    settings = "Настройки";
    confirm = "Принять";
  }

  void language_eng() {
    username = "username";
    email = "email";
    password = "password";
    password_help = "at least 8 symbols";
    submit = "Submit";
    language = "Language";
    settings = "Setting";
    confirm = "Confirm";
  }

  void language_che() {
    username = "uživatelské jméno";
    email = "e-mail";
    password = "heslo";
    password_help = "alespoň 8 symbolů";
    submit = "Odeslat";
    language = "Jazyk";
    settings = "Nastavení";
    confirm = "Confirm";
  }
}
