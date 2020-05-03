import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qooty/models/quote.dart';
import 'package:qooty/notifiers/design_notifier.dart';

class QuoteView extends StatelessWidget {
  const QuoteView({
    @required this.quote,
    this.onTap,
  });

  final GestureTapCallback onTap;
  final Quote quote;

  @override
  Widget build(BuildContext context) {
    final designer = Provider.of<DesignNotifier>(context);
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.centerLeft,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                quote.text,
                style: designer.textStyler(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              Text(
                '- ${quote.writer}',
                textAlign: TextAlign.end,
                style: designer.textStyler(fontSize: designer.fontSize / 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
