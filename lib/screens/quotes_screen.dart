import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qooty/models/quotes_data.dart';
import 'package:qooty/widgets/bottom_navigation_bar.dart';
import 'package:qooty/helpers/drawer.dart';
import 'package:qooty/widgets/drawer_item.dart';
import 'package:qooty/widgets/hideable_icon.dart';
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
    loadData();
  }

  Future<void> loadData() async {
    await QuotesData.loadQuotes();
    setState(() => _dataLoaded = true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: ClipPath(
        clipper: RightDrawerClipper(),
        child: Drawer(
          child: Align(
            alignment: Alignment.centerRight,
            child: SingleChildScrollView(
              padding: EdgeInsets.only(right: 30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  DrawerItem(
                    text: 'Favorites',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  DrawerItem(
                    text: 'Settings',
                    onPressed: () {},
                  ),
                  DrawerItem(
                    text: 'About Us',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Builder(
        builder: (BuildContext context) => SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        _focusMode ? Icons.visibility : Icons.visibility_off,
                        size: 20.0,
                        color: _focusMode ? Colors.white.withAlpha(75) : Colors.white,
                      ),
                      tooltip: 'Focuse Mode',
                      onPressed: () => setState(() => _focusMode = !_focusMode),
                    ),
                    Expanded(
                      child: Text(
                        'qooty',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'Economica',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.list, size: 20.0),
                      tooltip: 'Menu',
                      color: _focusMode ? Colors.white.withAlpha(75) : Colors.white,
                      onPressed: () => Scaffold.of(context).openEndDrawer(),
                    ),
                  ],
                ),
                Row(
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
                ),
                Expanded(
                  child: _dataLoaded ? QuoteView(fontSize: _fontSize) : Center(child: CircularProgressIndicator()),
                ),
                _dataLoaded ? BottomNavigationBarView(isHidden: _focusMode) : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}