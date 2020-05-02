import 'package:flutter/material.dart';
import 'package:qooty/app/app_state.dart';

class UiHelpers {
  static void info(BuildContext context, String text) {
    print(AppState.notificationsAlign);
    Scaffold.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: Colors.black,
        content: Text(
          text,
          textAlign: AppState.notificationsAlign,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
