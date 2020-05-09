import 'package:flutter/material.dart';
import 'package:qooty/designer/color_plate.dart';
import 'package:qooty/designer/theme_builder.dart';
import 'package:qooty/values/constants.dart';

class DesignNotifier extends ChangeNotifier {
  double fontSize = kDefaultFontSize;
  bool focusMode = false;
  double smallIconSize = kSmallIconSize;
  double mediumIconSize = kMediumIconSize;
  TextAlign notificationsAlign = TextAlign.center;
  ColorTwin colors = kDefaultColorPlate.colors;
  ThemeData theme = kDefaultTheme;

  void increaseFontSize() {
    if (fontSize < kMaxFontSize) fontSize += kFontSizeStep;
    notifyListeners();
  }

  void decreaseFontSize() {
    if (fontSize > kMinFontSize) fontSize -= kFontSizeStep;
    notifyListeners();
  }

  void resetFontSize() {
    fontSize = kDefaultFontSize;
    notifyListeners();
  }

  void updateTheme({
    @required ColorPlate plate,
    double fontSize = kDefaultFontSize,
  }) {
    colors = plate.colors;
    theme = ThemeBuilder.build(plate: plate, fontSize: fontSize);
    notifyListeners();
  }

  void toggelFocus() {
    focusMode = !focusMode;
    notifyListeners();
  }

  set textAlign(TextAlign align) {
    textAlign = align;
    notifyListeners();
  }

  // ===================================================================================================================
  // Helpers:

  get textStyle => theme.textTheme.bodyText2.copyWith(fontSize: fontSize);

  get textStyler => theme.textTheme.bodyText2.copyWith(fontSize: fontSize).copyWith;

  Icon smallICon(IconData icon) => Icon(icon, size: smallIconSize, color: colors.first);

  Icon mediumIcon(IconData icon) => Icon(icon, size: mediumIconSize, color: colors.first);

  Icon invertedSmallICon(IconData icon) => Icon(icon, size: smallIconSize, color: colors.second);

  Icon invertedMediumIcon(IconData icon) => Icon(icon, size: mediumIconSize, color: colors.second);

  Icon uncoloredSmallICon(IconData icon) => Icon(icon, size: smallIconSize);

  Icon uncoloredMediumIcon(IconData icon) => Icon(icon, size: mediumIconSize);
}
