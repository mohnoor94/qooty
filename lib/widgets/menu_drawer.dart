import 'package:flutter/material.dart';
import 'package:qooty/widgets/drawer_item.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Align(
        alignment: Alignment.centerRight,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(right: 30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DrawerItem(
                text: 'Black in White',
                onPressed: () {
                },
              ),
              DrawerItem(
                text: 'White in Black',
                onPressed: () {
                },
              ),
              DrawerItem(
                text: 'Blue in White',
                onPressed: () {},
              ),
              DrawerItem(
                text: 'White in Blue',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
