import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qooty/helpers/drawer.dart';
import 'package:qooty/models/user.dart';
import 'package:qooty/notifiers/design_notifier.dart';
import 'package:qooty/notifiers/quotes_notifier.dart';
import 'package:qooty/values/styles.dart';
import 'package:qooty/widgets/app_bar.dart';
import 'package:qooty/widgets/bottom_nav_bar.dart';
import 'package:qooty/widgets/font_controller_bar.dart';
import 'package:qooty/widgets/quote_interaction_bar.dart';
import 'package:qooty/widgets/loading.dart';
import 'package:qooty/widgets/menu_drawer.dart';
import 'package:qooty/widgets/quote_list_tile.dart';
import 'package:qooty/widgets/quote_view.dart';

class QuotesScreen extends StatefulWidget {
  @override
  _QuotesScreenState createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  bool _dataLoaded = false;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    loadData(context);
  }

  Future<void> loadData(BuildContext context) async {
    final quotesNotifier = QuotesNotifier();
    await quotesNotifier.loadQuotes();
    quotesNotifier.injectLikes(Provider.of<User>(context, listen: false).likes);
    setState(() => _dataLoaded = true);
  }

  @override
  Widget build(BuildContext context) {
    final designer = Provider.of<DesignNotifier>(context);
    final quotes = Provider.of<QuotesNotifier>(context);
    return Scaffold(
      endDrawer: ClipPath(
        clipper: RightDrawerClipper(),
        child: MenuDrawer(),
      ),
      bottomNavigationBar: BottomNavBar(
        onTap: (int index) => setState(() => _page = index),
      ),
      backgroundColor: designer.colors.second,
      body: Builder(
        builder: (BuildContext context) => SafeArea(
          child: DefaultTextStyle(
            style: designer.textStyle,
            child: Container(
              padding: Styles.quotesScreenPadding,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  QootyAppBar(),
                  FontControllerBar(),
                  // TODO: Update this MESS!!!
                  Expanded(
                    child: _page == 0
                        ? _dataLoaded ? QuoteView(quote: quotes.quote, onTap: quotes.next) : Loading()
                        : ListView(children: quotes.likes.map((q) => QuoteListItem(quote: q)).toList()),
                  ),
                  _page == 0 && _dataLoaded ? QuoteInteractionBar() : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
