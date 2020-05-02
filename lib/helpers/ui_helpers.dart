import 'package:flutter/material.dart';
import 'package:qooty/app/app_state.dart';
import 'package:qooty/values/colors.dart';

class UiHelpers {
  static void info(BuildContext context, String text) {
    print(AppState.notificationsAlign);
    Scaffold.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: AppColors.background,
        content: Text(
          text,
          textAlign: AppState.notificationsAlign,
          style: TextStyle(color: AppColors.main),
        ),
      ),
    );
  }
}
