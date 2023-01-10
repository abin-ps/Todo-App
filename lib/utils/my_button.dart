import 'package:flutter/material.dart';
import 'package:todo_app/themes/theme.dart';

class MyButton extends StatelessWidget {
  MyButton({super.key, required this.buttonText, required this.onPressed});
  final String buttonText;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(elevation: 0),
      child: Text(
        buttonText,
        style: const TextStyle(color: accentColor),
      ),
      onPressed: onPressed,
    );
  }
}
