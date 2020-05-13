import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qooty/designer/ui_utils.dart';
import 'package:qooty/helpers/drawer.dart';
import 'package:qooty/models/user.dart';
import 'package:qooty/notifiers/app_state.dart';
import 'package:qooty/notifiers/design_notifier.dart';
import 'package:qooty/notifiers/quotes_notifier.dart';
import 'package:qooty/screens/settings/themes.dart';
import 'package:qooty/values/constants.dart';
import 'package:qooty/values/messeges.dart';
import 'package:qooty/widgets/app_bar.dart';
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
      backgroundColor: designer.colors.second,
      body: Builder(
        builder: (BuildContext context) => SafeArea(
          child: DefaultTextStyle(
            style: designer.textStyle,
            child: Row(
              children: <Widget>[
                NavigationRail(
                  minWidth: 56,
                  selectedIndex: appState.page.index,
                  onDestinationSelected: appState.setPageByIndex,
                  labelType: NavigationRailLabelType.none,
                  groupAlignment: 0.85,
                  backgroundColor: designer.colors.second,
                  selectedIconTheme: IconThemeData(
                    color: designer.colors.first,
                  ),
                  unselectedIconTheme: IconThemeData(
                    color: designer.colors.first,
                    opacity: 0.5,
                  ),
                  leading: Column(
                    children: <Widget>[
                      SizedBox(height: 10),
                      IconButton(
                        icon: Icon(
                          designer.focusMode ? Icons.visibility : Icons.visibility_off,
                          size: 20.0,
                          color: conditionalOpacity(designer.focusMode, designer.colors.first, 0.25),
                        ),
                        tooltip: Messages.focusMode,
                        onPressed: () => designer.toggelFocus(),
                      ),
                      IconButton(
                        icon: designer.uncoloredSmallICon(Icons.color_lens),
                        tooltip: Messages.themes,
                        color: conditionalOpacity(designer.focusMode, designer.colors.first, 0.25),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ThemesScreen()),
                        ),
                      ),
                      if (appState.isQuotePage) SizedBox(height: MediaQuery.of(context).size.height * 0.307),
                      if (appState.isQuotePage) QuoteInteractionBar(),
                    ],
                  ),
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(Icons.bookmark_border),
                      selectedIcon: Icon(Icons.book),
                      label: Text('Second'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(Icons.favorite_border),
                      selectedIcon: Icon(Icons.favorite),
                      label: Text('First'),
                    ),
                  ],
                ),
                VerticalDivider(
                  thickness: 1,
                  width: 1,
                  color: designer.colors.first.withOpacity(0.25),
                ),
                Expanded(
                  child: Container(
                    padding: kDefaultScreenPadding,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        QootyAppBar(showTitleOnly: true),
                        FontControllerBar(),
                        // TODO: Update this MESS!!!
                        Expanded(
                          child: appState.isQuotePage
                              ? _dataLoaded ? QuoteView(quote: quotes.quote, onTap: quotes.next) : Loading()
                              : ListView.builder(
                                  itemCount: quotes.likes.length,
                                  itemBuilder: (_, index) => QuoteListItem(quote: quotes.likes[index]),
                                ),
                        ),
//                        if (appState.page == HomePage.quote && _dataLoaded)
//                          QuoteInteractionBar(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
