import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qooty/models/quote.dart';

class QuoteListItem extends StatelessWidget {
  const QuoteListItem({
    @required this.fontSize,
    @required this.quote,
    this.onTap,
  });

  final double fontSize;
  final GestureTapCallback onTap;
  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), topLeft: Radius.circular(20)),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Center(
                  child: Text(
                    quote.text,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontFamily: 'Economica',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Expanded(child: SizedBox()),
                    Text(
                      '- ${quote.writer}',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: fontSize / 2,
                        fontFamily: 'Economica',
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(CupertinoIcons.clear_circled),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
