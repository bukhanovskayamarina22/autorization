import 'package:autorization/main.dart';
import 'package:flutter/material.dart';
import '../../constants/controllers.dart';

class ConfirmButton extends StatefulWidget {
  const ConfirmButton({super.key});
  @override
  State<ConfirmButton> createState() => _ConfirmButtonState();
}

class _ConfirmButtonState extends State<ConfirmButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Align(
          widthFactor: 1,
          heightFactor: 1,
          alignment: Alignment.bottomCenter,
          child: const Text("Confirm"),
        ));
  }
}
