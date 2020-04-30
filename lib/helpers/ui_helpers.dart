import 'package:flutter/material.dart';

class UiHelpers {
  static void info(BuildContext context, String text) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: Colors.black,
        content: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
