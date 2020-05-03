import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qooty/helpers/ui_helpers.dart';
import 'package:qooty/notifiers/design_notifier.dart';
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
    // TODO: Why 2?
    final quotesNotifier = Provider.of<QuotesNotifier>(context, listen: false);
    final quotesNotifierListener = Provider.of<QuotesNotifier>(context);
    final designer = Provider.of<DesignNotifier>(context);
    _isLiked = quotesNotifierListener.isLiked;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        HideableIcon(
          icon: Icons.content_copy,
          tooltip: Messages.copy,
          onPressed: () {
            Clipboard.setData(ClipboardData(text: quotesNotifier.quote.toString()));
            UiHelpers.info(
              context: context,
              text: Messages.copied,
            );
          },
        ),
        HideableIcon(
          icon: _isLiked ? Icons.favorite : Icons.favorite_border,
          tooltip: _isLiked ? Messages.unlike : Messages.like,
          onPressed: () async {
            await quotesNotifierListener.toggleLike();
            setState(() => _isLiked = quotesNotifierListener.isLiked);
            UiHelpers.info(
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
