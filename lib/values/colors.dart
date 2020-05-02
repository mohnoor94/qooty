import 'package:flutter/material.dart';

import 'color_plate.dart';

class AppColors {
  static Color main = Colors.blue[900];
  static Color background = Colors.white;

  static void update(ColorPlate plate) {
    main = plate.colors.first;
    background = plate.colors.second;
  }
}
