import 'package:flutter/material.dart';
import 'package:gstin_app/services/constants.dart';

class TextButtonGreen extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  TextButtonGreen({
    required this.onPressed,
    required this.title,
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title,
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          green,
        ),
        foregroundColor: MaterialStateProperty.all(
          Colors.white,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            vertical: 25,
          ),
        ),
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontSize: 20,
            // fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
