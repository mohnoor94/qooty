import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:qooty/values/constants.dart';

enum Page {
  quote,
  likes,
}

class AppState extends ChangeNotifier {
  Page page = kDefaultPage;
  GlobalKey bottomNavigationKey = GlobalKey();

  void setPageByIndex(int index) {
    page = Page.values[index];
    notifyListeners();
  }

  void setPage(Page page) {
    this.page = page;
    final CurvedNavigationBarState navBarState = bottomNavigationKey.currentState;
    navBarState.setPage(page.index);
    notifyListeners();
  }
}
