import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qooty/notifiers/design_notifier.dart';
import 'package:qooty/values/constants.dart';

Color conditionalOpacity(bool condition, Color color, double opacity) => condition ? color.withOpacity(opacity) : color;

void showInfo({
  @required BuildContext context,
  @required String text,
}) {
  final designer = Provider.of<DesignNotifier>(context, listen: false);
  Scaffold.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 2),
      backgroundColor: designer.colors.second,
      content: Text(
        text,
        textAlign: designer.notificationsAlign,
        style: designer.textStyler(fontSize: kNotificationsFontSize),
      ),
    ),
  );
}