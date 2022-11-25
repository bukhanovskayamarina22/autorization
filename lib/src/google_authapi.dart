import 'package:flutter/material.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:http/http.dart' as http;

import '../pages/home_page.dart';

Future<AccessCredentials> GoogleAuthapi(BuildContext context) async {
  final client = http.Client();
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
    print("HAHAH");
    Navigator.of(context).pushNamed(HomePage.tag);
  }
}

void _prompt(String url) {
  print('Hi');
  print('Please go to the following URL and grant access:');
  print('  => $url');
  print('');
}
