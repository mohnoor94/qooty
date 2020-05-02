import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qooty/models/user.dart';
import 'package:qooty/screens/home/quotes.dart';
import '../notifiers/quotes_notifier.dart';
import 'authenticcate/authenticate.dart';

class AppRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return user != null
        ? ChangeNotifierProvider<QuotesNotifier>(
            create: (_) => QuotesNotifier(),
            child: QuotesScreen(),
          )
        : AuthenticationScreen();
  }
}
