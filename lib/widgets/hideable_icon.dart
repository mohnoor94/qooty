import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qooty/notifiers/design_notifier.dart';

class HideableIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String tooltip;

  const HideableIcon({
    @required this.icon,
    @required this.onPressed,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    final designer = Provider.of<DesignNotifier>(context);
    return Visibility(
      visible: !designer.focusMode,
      child: IconButton(
        icon: designer.smallICon(icon),
        onPressed: onPressed,
        tooltip: tooltip,
      ),
    );
  }
}
