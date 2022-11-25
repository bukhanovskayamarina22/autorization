import 'package:flutter/material.dart';
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

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
    client.close();
    Navigator.of(context).pushNamed(HomePage.tag);
  }
}

void _prompt(String url) async {
  Uri url_a = Uri.parse(url);
  if (await canLaunchUrl(url_a)) {
    launchUrl(url_a);
  }
}
