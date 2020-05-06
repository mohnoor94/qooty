import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qooty/helpers/drawer.dart';
import 'package:qooty/models/user.dart';
import 'package:qooty/notifiers/app_state.dart';
import 'package:qooty/notifiers/design_notifier.dart';
import 'package:qooty/notifiers/quotes_notifier.dart';
import 'package:qooty/values/styles.dart';
import 'package:qooty/widgets/app_bar.dart';
import 'package:qooty/widgets/bottom_nav_bar.dart';
import 'package:qooty/widgets/font_controller_bar.dart';
import 'package:qooty/widgets/loading.dart';
import 'package:qooty/widgets/menu_drawer.dart';
import 'package:qooty/widgets/quote_interaction_bar.dart';
import 'package:qooty/widgets/quote_list_tile.dart';
import 'package:qooty/widgets/quote_view.dart';

class QuotesScreen extends StatefulWidget {
  @override
  _QuotesScreenState createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  bool _dataLoaded = false;

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
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      endDrawer: ClipPath(
        clipper: RightDrawerClipper(),
        child: MenuDrawer(),
      ),
      bottomNavigationBar: BottomNavBar(onTap: appState.setPageByIndex),
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
                    child: appState.page == Page.quote
                        ? _dataLoaded ? QuoteView(quote: quotes.quote, onTap: quotes.next) : Loading()
                        : ListView.builder(
                            itemCount: quotes.likes.length,
                            itemBuilder: (_, index) => QuoteListItem(quote: quotes.likes[index]),
                          ),
                  ),
                  appState.page == Page.quote && _dataLoaded ? QuoteInteractionBar() : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
