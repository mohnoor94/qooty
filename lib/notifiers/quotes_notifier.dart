import 'dart:collection';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:qooty/models/quote.dart';
import 'package:qooty/services/data_manager.dart';

class QuotesNotifier extends ChangeNotifier {
  static int _current = 0;
  static List<Quote> _quotes = [];

  UnmodifiableListView<Quote> get quotes => UnmodifiableListView(_quotes);
  List<Quote> get likes => _quotes.where((q) => q.liked).toList();

  Future<void> loadQuotes() async {
    _quotes = await DataManager.getQuotes();
    next();
  }

  void injectLikes(List<int> ids) {
    _quotes.where((q) => ids.contains(q.id)).forEach((q) => q.like());
    notifyListeners();
  }

  void next() {
    _current = Random().nextInt(_quotes.length);
    notifyListeners();
  }

  Quote get quote => _quotes[_current];

  String get text => _quotes[_current].text;

  String get writerName => _quotes[_current].writer;

  bool get isLiked => _quotes[_current].liked;

  Future<bool> toggleLike() async {
    await DataManager.updateLikes(quote);
    return _quotes[_current].toggelLike();
  }
}
