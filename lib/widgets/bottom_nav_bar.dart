import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qooty/notifiers/app_state.dart';
import 'package:qooty/notifiers/design_notifier.dart';
import 'package:qooty/values/constants.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    @required this.onTap,
  });

  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    final designer = Provider.of<DesignNotifier>(context);
    final appState = Provider.of<AppState>(context);
    return CurvedNavigationBar(
      key: appState.bottomNavigationKey,
      color: designer.colors.first,
      backgroundColor: designer.colors.second,
      height: kBottomNavBarHeight,
      onTap: onTap,
      items: <Widget>[
        designer.invertedMediumIcon(CupertinoIcons.book_solid),
        designer.invertedMediumIcon(Icons.favorite),
      ],
    );
  }
}
