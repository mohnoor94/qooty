import 'package:flutter/material.dart';
import 'package:qooty/designer/theme_base.dart';

enum ColorPlate {
  qootyWhite,
  qootyBlue,
  blackInWhite,
  whiteInBlack,
  greyInWhite,
  whiteInGrey,
  greyInBlack,
  blackInGrey,
  blackInYellow,
  yellowInBlack,
  blackInOrange,
  orangeInBlack,
  pinkInWhite,
  whiteInPink,
}

class ColorTwin {
  final Color first;
  final Color second;

  ColorTwin(this.first, this.second);
}

extension ColorTwins on ColorPlate {
  static final names = {
    ColorPlate.qootyWhite:  'Qooty White',
    ColorPlate.qootyBlue:  'Qooty Blue',
    ColorPlate.blackInWhite: 'Classic',
    ColorPlate.whiteInBlack: 'Inversed',
    ColorPlate.greyInWhite:  'Grite',
    ColorPlate.whiteInGrey:  'Whiey',
    ColorPlate.greyInBlack: 'Grack',
    ColorPlate.blackInGrey: 'Blay',
    ColorPlate.blackInYellow: 'Blow',
    ColorPlate.yellowInBlack: 'Yelack',
    ColorPlate.blackInOrange: 'Blange',
    ColorPlate.orangeInBlack: 'Orack',
    ColorPlate.pinkInWhite:  'Pite',
    ColorPlate.whiteInPink:  'Whink',
  };
  static final twins = {
    ColorPlate.qootyWhite: ColorTwin(Colors.blue[900], Colors.white),
    ColorPlate.qootyBlue: ColorTwin(Colors.white, Colors.blue[900]),
    ColorPlate.blackInWhite: ColorTwin(Colors.black, Colors.white),
    ColorPlate.whiteInBlack: ColorTwin(Colors.white, Colors.black),
    ColorPlate.greyInWhite: ColorTwin(Colors.grey[800], Colors.white),
    ColorPlate.whiteInGrey: ColorTwin(Colors.white, Colors.grey[800]),
    ColorPlate.greyInBlack: ColorTwin(Colors.grey[200], Colors.black),
    ColorPlate.blackInGrey: ColorTwin(Colors.black, Colors.grey[200]),
    ColorPlate.blackInYellow: ColorTwin(Colors.black, Colors.yellow[200]),
    ColorPlate.yellowInBlack: ColorTwin(Colors.yellow, Colors.black),
    ColorPlate.blackInOrange: ColorTwin(Colors.black, Colors.orange[300]),
    ColorPlate.orangeInBlack: ColorTwin(Colors.orange[300], Colors.black),
    ColorPlate.pinkInWhite: ColorTwin(Colors.pink, Colors.white),
    ColorPlate.whiteInPink: ColorTwin(Colors.white, Colors.pink),
  };

  static final bases = {
    ColorPlate.qootyWhite: ThemeBase.light,
    ColorPlate.qootyBlue: ThemeBase.light,
    ColorPlate.blackInWhite: ThemeBase.light,
    ColorPlate.whiteInBlack: ThemeBase.dark,
    ColorPlate.greyInWhite: ThemeBase.light,
    ColorPlate.whiteInGrey: ThemeBase.light,
    ColorPlate.greyInBlack: ThemeBase.dark,
    ColorPlate.blackInGrey: ThemeBase.dark,
    ColorPlate.blackInYellow: ThemeBase.dark,
    ColorPlate.yellowInBlack: ThemeBase.dark,
    ColorPlate.blackInOrange: ThemeBase.dark,
    ColorPlate.orangeInBlack: ThemeBase.dark,
    ColorPlate.pinkInWhite: ThemeBase.light,
    ColorPlate.whiteInPink: ThemeBase.light,
  };

  String get name => names[this];

  ColorTwin get colors => twins[this];

  ThemeBase get base => bases[this];
}
