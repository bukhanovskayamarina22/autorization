import 'package:autorization/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

//Выловить отсюда email и токен
Future<AccessCredentials> signIn() async {
  final client = http.Client();
  print(client);
  String url_a = '';
  try {
    return await obtainAccessCredentialsViaUserConsent(
      ClientId(
          '551314006766-4rfg36nct9if6o3hs326q3qa3qlm8kfo.apps.googleusercontent.com',
          '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'),
      ['email'],
      client,
      _prompt,
    );
  } finally {
    print("Hey");
    client.close();
  }
}

void _prompt(String url) {
  print('Hi');
  print('Please go to the following URL and grant access:');
  print('  => $url');
  print('');
}



/*enum LoginProvider { google, azure }

extension LoginProviderExtension on LoginProvider {
  String get key {
    switch (this) {
      case LoginProvider.google:
        return 'google';
      case LoginProvider.azure:
        return 'azure';
    }
  }

  String get authorizationEndpoint {
    switch (this) {
      case LoginProvider.google:
        return "https://accounts.google.com/o/oauth2/v2/auth";
      case LoginProvider.azure:
        return "https://login.microsoftonline.com/common/oauth2/v2.0/authorize";
    }
  }

  String get tokenEndpoint {
    switch (this) {
      case LoginProvider.google:
        return "https://oauth2.googleapis.com/token";
      case LoginProvider.azure:
        return "https://login.microsoftonline.com/common/oauth2/v2.0/token";
    }
  }

  String get clientId {
    switch (this) {
      case LoginProvider.google:
        return "184096741827-ddu6285rf3rlrvu0grnjb62adh7j1ad5.apps.googleusercontent.com";
      case LoginProvider.azure:
        return "AZURE_CLIENT_ID";
    }
  }

  String? get clientSecret {
    switch (this) {
      case LoginProvider.google:
        return "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"; // if applicable
      case LoginProvider.azure:
        return "AZURE_SECRET"; // if applicable
    }
  }

  List<String> get scopes {
    return ['openid', 'email']; // OAuth Scopes
  }
}

*/