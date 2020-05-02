import 'package:flutter/material.dart';

enum ColorPlate {
  blackInWhite,
  whiteInBlack,
  blueInWhite,
  whiteInBlue,
}

class ColorTwin {
  final Color first;
  final Color second;

  ColorTwin(this.first, this.second);
}

extension ColorTwins on ColorPlate {
  static final twins = {
    ColorPlate.blackInWhite: ColorTwin(Colors.white, Colors.black),
    ColorPlate.whiteInBlack: ColorTwin(Colors.black, Colors.white),
    ColorPlate.blueInWhite: ColorTwin(Colors.white, Colors.blue[900]),
    ColorPlate.whiteInBlue: ColorTwin(Colors.blue[900], Colors.white),
  };

  ColorTwin get colors => twins[this];
}
