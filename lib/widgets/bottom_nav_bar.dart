import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qooty/notifiers/app_state.dart';
import 'package:qooty/notifiers/design_notifier.dart';
import 'package:qooty/values/messeges.dart';

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final designer = Provider.of<DesignNotifier>(context);
    final appState = Provider.of<AppState>(context);
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            CupertinoIcons.book_solid,
            color: designer.colors.first,
          ),
          title: Text(Messages.allPageTitle),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: designer.colors.first,
          ),
          title: Text(Messages.like),
        ),
      ],
      currentIndex: appState.page.index,
      selectedItemColor: designer.colors.first,
      backgroundColor: designer.colors.second,
      unselectedItemColor: designer.colors.first.withOpacity(0.5),
      onTap: appState.setPageByIndex,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      elevation: 0,
    );
  }
}
