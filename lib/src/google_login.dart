import 'package:autorization/src/google_auth_api.dart';
import 'package:flutter/material.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;

Future GoogleLogin() async {
  AccessCredentials client = await GoogleAuthapi();
  if (client == null) {
    return false;
  }
  var tokenUser = client.accessToken.data;

  Uri endPoint = Uri.parse('https://www.googleapis.com/oauth2/v1/userinfo');
  Map<String, String> tokenMap = {'Authorization': 'Bearer $tokenUser'};
  var clientInfoJson = await http.get(endPoint, headers: tokenMap);

  return clientInfoJson.body;
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