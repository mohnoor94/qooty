import 'package:flutter/material.dart';
import 'package:qooty/app/app_state.dart';
import 'package:qooty/values/color_plate.dart';
import 'package:qooty/values/colors.dart';
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
                  AppColors.update(ColorPlate.blackInWhite);
                },
              ),
              DrawerItem(
                text: 'White in Black',
                onPressed: () {
                  AppColors.update(ColorPlate.whiteInBlack);
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
//              DrawerItem(
//                text: 'Favorites',
//                onPressed: () {
//                  Navigator.pop(context);
//                },
//              ),
//              DrawerItem(
//                text: 'Settings',
//                onPressed: () {},
//              ),
//              DrawerItem(
//                text: 'About Us',
//                onPressed: () {},
//              ),
            ],
          ),
        ),
      ),
    );
  }
}
