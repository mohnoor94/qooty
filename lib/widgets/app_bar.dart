import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qooty/notifiers/design_notifier.dart';
import 'package:qooty/values/constants.dart';
import 'package:qooty/values/messeges.dart';

class QootyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final designer = Provider.of<DesignNotifier>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(
            designer.focusMode ? Icons.visibility : Icons.visibility_off,
            size: 20.0,
            color: designer.focusMode ? designer.colors.first.withOpacity(0.25) : designer.colors.first,
          ),
          tooltip: Messages.focusMode,
          onPressed: () => designer.toggelFocus(),
        ),
        Expanded(
          child: Text(
            Messages.appName,
            textAlign: TextAlign.center,
            style: designer.textStyler(fontSize: kDefaultFontSize),
          ),
        ),
        IconButton(
          icon: designer.smallICon(Icons.list),
          tooltip: Messages.menu,
          color: designer.focusMode ? designer.colors.first.withOpacity(0.25) : designer.colors.first,
          onPressed: () => Scaffold.of(context).openEndDrawer(),
        ),
      ],
    );
  }
}
