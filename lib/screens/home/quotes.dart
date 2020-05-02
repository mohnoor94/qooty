import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qooty/app/app_state.dart';
import 'package:qooty/helpers/drawer.dart';
import 'package:qooty/models/user.dart';
import 'package:qooty/notifiers/quotes_notifier.dart';
import 'package:qooty/values/colors.dart';
import 'package:qooty/values/styles.dart';
import 'package:qooty/widgets/bottom_navigation_bar.dart';
import 'package:qooty/widgets/hideable_icon.dart';
import 'package:qooty/widgets/loading.dart';
import 'package:qooty/widgets/menu_drawer.dart';
import 'package:qooty/widgets/quote_list_tile.dart';
import 'package:qooty/widgets/quote_view.dart';

class QuotesScreen extends StatefulWidget {
  @override
  _QuotesScreenState createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  double _fontSize = 40.0;
  bool _focusMode = false;
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
    return Scaffold(
      endDrawer: ClipPath(
        clipper: RightDrawerClipper(),
        child: MenuDrawer(),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppColors.background,
        color: AppColors.main,
        height: 50.0,
        items: <Widget>[
          Icon(
            CupertinoIcons.book_solid,
            size: 30,
            color: AppColors.background,
          ),
          Icon(
            Icons.favorite,
            size: 30,
            color: AppColors.background,
          ),
        ],
        onTap: (index) {
          setState(() {
            AppState.page = index == 0? Page.main : Page.likes;
          });
        },
      ),
      backgroundColor: AppColors.background,
      body: Builder(
        builder: (BuildContext context) => SafeArea(
          child: Container(
            padding: Styles.quotesScreenPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                titleBar(context),
                textControlBar(),
                Expanded(
                  child: AppState.page == Page.main
                      ? _dataLoaded
                          ? QuoteView(
                              quote: Provider.of<QuotesNotifier>(context).quote,
                              fontSize: _fontSize,
                              onTap: () => Provider.of<QuotesNotifier>(context, listen: false).next(),
                            )
                          : Center(child: Loading())
                      : ListView(
                          children: Provider.of<QuotesNotifier>(context)
                              .likes
                              .map(
                                (q) => QuoteListItem(
                                  quote: q,
                                  fontSize: _fontSize,
                                ),
                              )
                              .toList(),
                        ),
                ),
                AppState.page == Page.main && _dataLoaded ? BottomNavigationBarView(isHidden: _focusMode) : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row titleBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        IconButton(
          icon: Icon(
            _focusMode ? Icons.visibility : Icons.visibility_off,
            size: 20.0,
            color: _focusMode ? AppColors.main.withAlpha(75) : AppColors.main,
          ),
          tooltip: 'Focuse Mode',
          onPressed: () => setState(() => _focusMode = !_focusMode),
        ),
        Expanded(
          child: Text(
            'qooty',
            textAlign: TextAlign.center,
            style: Styles.quoteTextStyle,
          ),
        ),
        IconButton(
          icon: Icon(Icons.list, size: 20.0),
          tooltip: 'Menu',
          color: _focusMode ? AppColors.main.withAlpha(75) : AppColors.main,
          onPressed: () => Scaffold.of(context).openEndDrawer(),
        ),
      ],
    );
  }

  Row textControlBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: SizedBox(),
        ),
        HideableIcon(
          hidden: _focusMode,
          icon: CupertinoIcons.minus_circled,
          tooltip: 'Decrease Font Size',
          onPressed: () {
            if (_fontSize > 10) setState(() => _fontSize -= 2);
          },
        ),
        HideableIcon(
          hidden: _focusMode,
          icon: CupertinoIcons.plus_circled,
          tooltip: 'Increase Font Size',
          onPressed: () {
            if (_fontSize < 100) setState(() => _fontSize += 2);
          },
        ),
        HideableIcon(
          hidden: _focusMode,
          icon: CupertinoIcons.refresh_circled,
          tooltip: 'Reset Font Size',
          onPressed: () => setState(() => _fontSize = 40.0),
        ),
      ],
    );
  }
}
