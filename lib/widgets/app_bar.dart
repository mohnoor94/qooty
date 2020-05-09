import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qooty/designer/ui_utils.dart';
import 'package:qooty/notifiers/design_notifier.dart';
import 'package:qooty/screens/settings/themes.dart';
import 'package:qooty/values/constants.dart';
import 'package:qooty/values/messeges.dart';

class QootyAppBar extends StatelessWidget {
  final bool showTitleOnly;

  const QootyAppBar({this.showTitleOnly = false});

  @override
  Widget build(BuildContext context) {
    final designer = Provider.of<DesignNotifier>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: getBarItems(context: context, designer: designer),
    );
  }

  List<Widget> getBarItems({BuildContext context, DesignNotifier designer}) => showTitleOnly
      ? <Widget>[appName(designer)]
      : <Widget>[focusModeIcon(designer), appName(designer), menu(designer, context), themes(designer, context)];

  IconButton themes(DesignNotifier designer, BuildContext context) {
    return IconButton(
      icon: designer.uncoloredSmallICon(Icons.color_lens),
      tooltip: Messages.themes,
      color: conditionalOpacity(designer.focusMode, designer.colors.first, 0.25),
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ThemesScreen()),
      ),
    );
  }

  Visibility menu(DesignNotifier designer, BuildContext context) {
    return Visibility(
      visible: false,
      child: IconButton(
        icon: designer.uncoloredSmallICon(Icons.list),
        tooltip: Messages.menu,
        color: conditionalOpacity(designer.focusMode, designer.colors.first, 0.25),
        onPressed: () => Scaffold.of(context).openEndDrawer(),
      ),
    );
  }

  Expanded appName(DesignNotifier designer) {
    return Expanded(
      child: Text(
        Messages.appName,
        textAlign: TextAlign.center,
        style: designer.textStyler(fontSize: kDefaultFontSize),
      ),
    );
  }

  IconButton focusModeIcon(DesignNotifier designer) {
    return IconButton(
      icon: Icon(
        designer.focusMode ? Icons.visibility : Icons.visibility_off,
        size: 20.0,
        color: conditionalOpacity(designer.focusMode, designer.colors.first, 0.25),
      ),
      tooltip: Messages.focusMode,
      onPressed: () => designer.toggelFocus(),
    );
  }
}
