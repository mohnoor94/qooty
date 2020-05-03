import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qooty/notifiers/design_notifier.dart';

class DrawerItem extends StatelessWidget {
  final String text;
  final Function onPressed;

  const DrawerItem({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final designer = Provider.of<DesignNotifier>(context);
    return FlatButton(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Text(
        text,
        style: designer.textStyler(color: designer.colors.second),
      ),
      onPressed: onPressed,
    );
  }
}
