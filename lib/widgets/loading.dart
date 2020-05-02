import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qooty/values/colors.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitPumpingHeart(
      color: AppColors.main,
      size: 75.0,
    );
  }
}
