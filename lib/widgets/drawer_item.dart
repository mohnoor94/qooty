import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String text;
  final Function onPressed;

  const DrawerItem({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 40.0,
          fontFamily: 'Economica',
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
