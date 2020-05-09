import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qooty/designer/ui_utils.dart';
import 'package:qooty/notifiers/quotes_notifier.dart';
import 'package:qooty/values/messeges.dart';
import 'package:qooty/widgets/hideable_icon.dart';
import 'package:share/share.dart';

class QuoteInteractionBar extends StatefulWidget {
  @override
  _QuoteInteractionBarState createState() => _QuoteInteractionBarState();
}

class _QuoteInteractionBarState extends State<QuoteInteractionBar> {
  bool _isLiked;

  @override
  Widget build(BuildContext context) {
    final quotesNotifier = Provider.of<QuotesNotifier>(context);
    _isLiked = quotesNotifier.isLiked;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        HideableIcon(
          icon: Icons.content_copy,
          tooltip: Messages.copy,
          onPressed: () {
            Clipboard.setData(ClipboardData(text: quotesNotifier.quote.toString()));
            showInfo(
              context: context,
              text: Messages.copied,
            );
          },
        ),
        HideableIcon(
          icon: _isLiked ? Icons.favorite : Icons.favorite_border,
          tooltip: _isLiked ? Messages.unlike : Messages.like,
          onPressed: () async {
            await quotesNotifier.toggleLike();
            setState(() => _isLiked = quotesNotifier.isLiked);
            showInfo(
              context: context,
              text: _isLiked ? Messages.addedToLikes : Messages.removedFromLikes,
            );
          },
        ),
        HideableIcon(
          icon: Icons.share,
          tooltip: Messages.share,
          onPressed: () => Share.share(quotesNotifier.quote.toString()),
        ),
      ],
    );
  }
}
