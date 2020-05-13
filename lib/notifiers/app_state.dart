import 'package:flutter/material.dart';
import 'package:qooty/values/constants.dart';

enum HomePage {
  quote,
  likes,
}

class AppState extends ChangeNotifier {
  HomePage page = kDefaultPage;
  AppState(): page = kDefaultPage;

  void setPageByIndex(int index) {
    page = HomePage.values[index];
    notifyListeners();
  }

  void setPage(HomePage page) {
    this.page = page;
    notifyListeners();
  }

  bool get isQuotePage => page == HomePage.quote;
}
