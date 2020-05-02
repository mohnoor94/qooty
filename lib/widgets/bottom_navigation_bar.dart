import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qooty/helpers/ui_helpers.dart';
import 'package:qooty/notifiers/quotes_notifier.dart';
import 'package:qooty/values/messeges.dart';
import 'package:qooty/widgets/hideable_icon.dart';
import 'package:share/share.dart';

class BottomNavigationBarView extends StatefulWidget {
  const BottomNavigationBarView({
    @required this.isHidden,
  });

  final bool isHidden;

  @override
  _BottomNavigationBarViewState createState() => _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
  bool _isLiked;

  @override
  Widget build(BuildContext context) {
    final quotesNotifier = Provider.of<QuotesNotifier>(context, listen: false);
    final quotesNotifierListener = Provider.of<QuotesNotifier>(context);
    _isLiked = quotesNotifierListener.isLiked;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        HideableIcon(
          hidden: widget.isHidden,
          icon: Icons.content_copy,
          tooltip: Messages.copy,
          onPressed: () {
            Clipboard.setData(ClipboardData(text: quotesNotifier.quote.toString()));
            UiHelpers.info(context, Messages.copied);
          },
        ),
        HideableIcon(
          hidden: widget.isHidden,
          icon: _isLiked ? Icons.favorite : Icons.favorite_border,
          tooltip: _isLiked ? Messages.unlike : Messages.like,
          onPressed: () async {
            await quotesNotifierListener.toggleLike();
            setState(() => _isLiked = quotesNotifierListener.isLiked);
            UiHelpers.info(context, _isLiked ? Messages.addedToLikes : Messages.removedFromLikes);
          },
        ),
        HideableIcon(
          hidden: widget.isHidden,
          icon: Icons.share,
          tooltip: Messages.share,
          onPressed: () => Share.share(quotesNotifier.quote.toString()),
        ),
      ],
    );
  }
}
