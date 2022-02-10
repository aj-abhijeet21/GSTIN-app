import 'package:flutter/material.dart';
import 'package:gstin_app/services/constants.dart';

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
