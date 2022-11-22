class language_class {
  String username = 'username';
  String email = "email";
  String password = "password";
  String password_help = "at least 8 symbols";
  String submit = "Submit";
  String language = "Language";

  int number_language = 1;

  void change_language(int x) {
    switch (x) {
      case 0:
        language_rus();
        break;
      case 1:
        language_eng();
        break;
      case 2:
        language_che();
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
  }

  void language_eng() {
    username = "username";
    email = "email";
    password = "password";
    password_help = "at least 8 symbols";
    submit = "Submit";
    language = "Language";
  }

  void language_che() {
    username = "uživatelské jméno";
    email = "e-mail";
    password = "heslo";
    password_help = "alespoň 8 symbolů";
    submit = "Odeslat";
    language = "Jazyk";
  }
}
