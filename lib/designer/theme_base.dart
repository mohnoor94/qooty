import 'package:flutter/material.dart';

enum ThemeBase {
  light,
  dark,
}

extension ThemeBaseExtension on ThemeBase {
  static final values = {
    ThemeBase.light: ThemeData.light(),
    ThemeBase.dark: ThemeData.dark(),
  };

  ThemeData get value => values[this];
}
