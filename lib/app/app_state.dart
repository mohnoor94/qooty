import 'package:flutter/painting.dart';

enum Page {
  main,
  likes,
}

class AppState {
  static Page page = Page.main;

  static TextAlign notificationsAlign = TextAlign.right;

  static toggelPage() {
    if (page == Page.main) {
      page = Page.likes;
      notificationsAlign = TextAlign.left;
    } else {
      page = Page.main;
      notificationsAlign = TextAlign.right;
    }
  }
}
