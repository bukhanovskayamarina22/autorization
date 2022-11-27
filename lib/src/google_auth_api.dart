import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

Future<AccessCredentials> GoogleAuthapi() async {
  final client = http.Client();
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
    print("HAHA");
    client.close();
  }
}

void _prompt(String url) async {
  Uri urlA = Uri.parse(url);
  if (await canLaunchUrl(urlA)) {
    launchUrl(urlA);
  }
}
