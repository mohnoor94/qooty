import 'dart:collection';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:qooty/helpers/utils.dart';
import 'package:qooty/models/quote.dart';
import 'package:qooty/services/data_manager.dart';

class QuotesNotifier extends ChangeNotifier {
  static Random _random = Random();
  static int _current = 0;
  static List<Quote> _quotes = [];

  UnmodifiableListView<Quote> get quotes => UnmodifiableListView(_quotes);

  List<Quote> get likes => _quotes.where((q) => q.liked).toList();

  Future<void> loadQuotes() async {
    _quotes = await DataManager.getQuotes();
    _quotes.sort((first, second) => first.id - second.id);
    next();
  }

  void injectLikes(List<int> ids) {
    _quotes.where((q) => ids.contains(q.id)).forEach((q) => q.like());
    notifyListeners();
  }

  void next() {
    _current = _random.nextInt(_quotes.length);
    notifyListeners();
  }

  void setQuote(Quote quote) {
    _current = quote.id;
    notifyListeners();
  }

  Quote get quote => _safelyReturn(() => _quotes[_current], () => Quote.dummy());

  String get text => _safelyReturn(() => _quotes[_current].text, () => '');

  String get writerName => _safelyReturn(() => _quotes[_current].writer, () => '');

  bool get isLiked => _safelyReturn(() => _quotes[_current].liked, () => false);

  Future<bool> toggleLike() async {
    await DataManager.updateLikes(quote);
    return _quotes[_current].toggelLike();
  }

  T _safelyReturn<T>(T Function() safeValueProvider, T Function() defaultValueProvider) =>
      safelyReturn(() => _quotes.isNotEmpty, safeValueProvider, defaultValueProvider);
}
