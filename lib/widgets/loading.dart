import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:qooty/notifiers/design_notifier.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitPumpingHeart(
        color: Provider.of<DesignNotifier>(context).colors.first,
        size: 75.0,
      ),
    );
  }
}
