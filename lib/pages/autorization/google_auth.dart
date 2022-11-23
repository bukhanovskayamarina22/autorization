import 'package:flutter/material.dart';

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
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: OutlinedButton(onPressed: () {}, child: const Text('Google')),
    );
  }
}
