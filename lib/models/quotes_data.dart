import 'dart:collection';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:qooty/models/quote.dart';
import 'package:qooty/services/data_provider.dart';

class QuotesData extends ChangeNotifier {
  static int _current = 0;
  static List<Quote> _quotes = [];

  UnmodifiableListView<Quote> get quotes => UnmodifiableListView(_quotes);

  static Future<void> loadQuotes() async {
    _quotes = await FirestoreDataProvider.getQuotes();
  }

  void next() {
    _current = Random().nextInt(_quotes.length);
    notifyListeners();
  }

  Quote get quote => _quotes[_current];

  String get text => _quotes[_current].text;

  String get writerName => _quotes[_current].writer;

  bool get loved => _quotes[_current].loved;
}
