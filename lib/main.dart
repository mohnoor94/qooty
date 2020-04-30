import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qooty/services/authenticator.dart';
import 'package:qooty/models/quotes_data.dart';
import 'package:qooty/screens/quotes_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAuthenticator.signIn();

    return ChangeNotifierProvider<QuotesData>(
      create: (BuildContext context) => QuotesData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          canvasColor: Colors.white,
          accentColor: Colors.white,
        ),
        home: QuotesScreen(),
      ),
    );
  }
}
