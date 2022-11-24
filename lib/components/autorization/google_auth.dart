import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GoogleAuth extends StatefulWidget {
  const GoogleAuth({
    Key? key,
  }) : super(key: key);

  @override
  State<GoogleAuth> createState() => _GoogleAuthState();
}

class _GoogleAuthState extends State<GoogleAuth> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 70),
      child: Container(
        width: double.infinity,
        color: Colors.transparent,
        child: OutlinedButton(
            onPressed: () {},
            child: Text(AppLocalizations.of(context)!.pageLoginButtonGoogle)),
      ),
    );
  }
}
