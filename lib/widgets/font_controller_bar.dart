import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qooty/notifiers/design_notifier.dart';
import 'package:qooty/values/messeges.dart';
import 'package:qooty/widgets/hideable_icon.dart';

class FontControllerBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final designer = Provider.of<DesignNotifier>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: SizedBox(),
        ),
        HideableIcon(
          icon: CupertinoIcons.minus_circled,
          tooltip: Messages.decreaseFontSize,
          onPressed: designer.decreaseFontSize,
        ),
        HideableIcon(
          icon: CupertinoIcons.plus_circled,
          tooltip: Messages.increaseFontSize,
          onPressed: designer.increaseFontSize,
        ),
        HideableIcon(
          icon: CupertinoIcons.refresh_circled,
          tooltip: Messages.resetFontSize,
          onPressed: designer.resetFontSize,
        ),
      ],
    );
  }
}
