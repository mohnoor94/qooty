import 'package:flutter/material.dart';
import 'package:qooty/designer/color_plate.dart';
import 'package:qooty/designer/theme_builder.dart';
import 'package:qooty/notifiers/app_state.dart';

// Fonts
const double kDefaultFontSize = 30;
const double kNotificationsFontSize = 20;
const double kMaxFontSize = 100;
const double kMinFontSize = 10;
const double kFontSizeStep = 2;
const String kFontFamily = 'Economica';

// Icons
const double kSmallIconSize = 20;
const double kMediumIconSize = 30;
const double kBigIconSize = 50;

// Navigation Bars
const double kBottomNavBarHeight = 50;

// Themes
const ColorPlate kDefaultColorPlate = ColorPlate.qootyBlue;
final ThemeData kDefaultTheme = ThemeBuilder.build(
  plate: kDefaultColorPlate,
  fontSize: kDefaultFontSize,
);

// App State
const HomePage kDefaultPage = HomePage.quote;

// Styles
const kDefaultScreenPadding = EdgeInsets.all(20.0);
