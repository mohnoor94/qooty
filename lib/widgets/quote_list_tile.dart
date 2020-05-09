import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qooty/models/quote.dart';
import 'package:qooty/notifiers/app_state.dart';
import 'package:qooty/notifiers/design_notifier.dart';
import 'package:qooty/notifiers/quotes_notifier.dart';

class QuoteListItem extends StatelessWidget {
  const QuoteListItem({
    @required this.quote,
    this.onTap,
  });

  final GestureTapCallback onTap;
  final Quote quote;

  @override
  Widget build(BuildContext context) {
    final quotes = Provider.of<QuotesNotifier>(context);
    final designer = Provider.of<DesignNotifier>(context);
    final appState = Provider.of<AppState>(context);
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            highlightColor: designer.colors.second,
            splashColor: designer.colors.first.withOpacity(0.2),
            onTap: () {
              quotes.setQuote(quote);
              appState.setPage(HomePage.quote);
            },
            child: Text(
              quote.text,
              style: designer.textStyler(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10.0),
          Divider(color: designer.colors.first.withOpacity(0.5)),
        ],
      ),
    );
  }
}
