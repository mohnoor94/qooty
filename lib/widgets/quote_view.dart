import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qooty/models/quotes_data.dart';

class QuoteView extends StatelessWidget {
  const QuoteView({
    @required this.fontSize,
  });

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Provider.of<QuotesData>(context, listen: false).next(),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Center(
                child: Text(
                  Provider.of<QuotesData>(context).text,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontFamily: 'Economica',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                '- ${Provider.of<QuotesData>(context).writerName}',
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
