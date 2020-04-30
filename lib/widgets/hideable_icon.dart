import 'package:flutter/material.dart';

class HideableIcon extends StatelessWidget {
  final bool hidden;
  final IconData icon;
  final VoidCallback onPressed;
  final String tooltip;

  const HideableIcon({
    @required this.hidden,
    @required this.icon,
    @required this.onPressed,
    this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !hidden,
      child: IconButton(
        icon: Icon(icon, size: 20.0),
        onPressed: onPressed,
        tooltip: tooltip,
      ),
    );
  }
}
