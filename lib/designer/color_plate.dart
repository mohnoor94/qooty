import 'package:flutter/material.dart';

enum ColorPlate {
  blackInWhite,
  whiteInBlack,
  blueInWhite,
  whiteInBlue,
  greyInWhite,
  whiteInGrey,
  greyInBlack,
  blackInGrey,
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
    ColorPlate.greyInWhite: ColorTwin(Colors.white, Colors.grey[800]),
    ColorPlate.whiteInGrey: ColorTwin(Colors.grey[800], Colors.white),
    ColorPlate.greyInBlack: ColorTwin(Colors.black, Colors.grey[200]),
    ColorPlate.blackInGrey: ColorTwin(Colors.grey[200], Colors.black),
  };

  ColorTwin get colors => twins[this];
}
