import 'package:flutter/material.dart';
import 'package:qooty/models/quote.dart';

class QuoteView extends StatelessWidget {
  const QuoteView({
    @required this.fontSize,
    @required this.quote,
    this.onTap,
  });

  final double fontSize;
  final GestureTapCallback onTap;
  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
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
              Text(
                '- ${quote.writer}',
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: fontSize / 2,
                  fontFamily: 'Economica',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
