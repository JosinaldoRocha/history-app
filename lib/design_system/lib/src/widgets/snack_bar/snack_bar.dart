import 'package:flutter/material.dart';

class AppSnackBar {
  static void show(
      {required String text, required BuildContext context, Color? color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color ?? Colors.red,
        content: Text(text),
      ),
    );
  }
}
