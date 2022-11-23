import 'package:flutter/material.dart';

class AppleAuth extends StatefulWidget {
  const AppleAuth({
    Key? key,
  }) : super(key: key);

  @override
  State<AppleAuth> createState() => _AppleAuthState();
}

class _AppleAuthState extends State<AppleAuth> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      child: OutlinedButton(onPressed: () {}, child: const Text('Apple ID')),
    );
  }
}
