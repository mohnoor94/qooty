import 'package:flutter/material.dart';
import 'package:qooty/designer/color_plate.dart';
import 'package:qooty/designer/theme_base.dart';
import 'package:qooty/values/constants.dart';

class ThemeBuilder {
  static ThemeData build({
    @required ColorPlate plate,
    double fontSize = kDefaultFontSize,
  }) {
    assert(fontSize >= kMinFontSize && fontSize <= kMaxFontSize);

    return plate.base.value.copyWith(
      canvasColor: plate.colors.first,
      accentColor: plate.colors.first,
      primaryColor: plate.colors.second,
      primaryColorLight: plate.colors.second,
      primaryColorDark: plate.colors.second,
      backgroundColor: plate.colors.second,
      textTheme: TextTheme(
        bodyText2: TextStyle(
          fontSize: fontSize,
          color: plate.colors.first,
        ),
      ).apply(
        bodyColor: plate.colors.first,
        displayColor: plate.colors.first,
        fontFamily: kFontFamily,
      ),
    );
  }
}
