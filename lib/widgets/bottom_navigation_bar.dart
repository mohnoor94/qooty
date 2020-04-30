import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qooty/helpers/ui_helpers.dart';
import 'package:qooty/models/quotes_data.dart';
import 'package:qooty/widgets/hideable_icon.dart';

class BottomNavigationBarView extends StatelessWidget {
  const BottomNavigationBarView({
    @required this.isHidden,
  });

  final bool isHidden;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        HideableIcon(
          hidden: isHidden,
          icon: Icons.content_copy,
          tooltip: 'Copy',
          onPressed: () {
            Clipboard.setData(ClipboardData(
              text: '${Provider.of<QuotesData>(context, listen: false).text}\n\n'
                  '- ${Provider.of<QuotesData>(context, listen: false).writerName}',
            ));
            UiHelpers.info(context, 'Copied to your clipboard!');
          },
        ),
        HideableIcon(
          hidden: isHidden,
          icon: Provider.of<QuotesData>(context).loved ? Icons.favorite : Icons.favorite_border,
          tooltip: Provider.of<QuotesData>(context).loved ? 'Unlike' : 'Like',
          onPressed: () {
            UiHelpers.info(context, 'Added to your favoirtes list!');
          },
        ),
        HideableIcon(
          hidden: isHidden,
          icon: Icons.share,
          tooltip: 'Share',
          onPressed: () {},
        ),
      ],
    );
  }
}
