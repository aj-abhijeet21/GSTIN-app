import 'package:flutter/material.dart';
import 'package:gstin_app/services/constants.dart';

class CardWidget extends StatelessWidget {
  final Widget child;
  CardWidget({required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: child,
    );
  }
}

class RoundedHeader extends StatelessWidget {
  Widget child;
  RoundedHeader({required this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        color: green,
      ),
      child: child,
    );
  }
}

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

class ShowAlertDialog extends StatelessWidget {
  final String message;
  ShowAlertDialog(this.message);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Error'),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go Back'),
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
          ),
        ),
      ],
    );
  }
}
