import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qooty/notifiers/app_state.dart';
import 'package:qooty/notifiers/design_notifier.dart';
import 'package:qooty/screens/app_router.dart';
import 'package:qooty/services/auth_service.dart';

void main() => runApp(Qooty());

class Qooty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DesignNotifier>(
      create: (_) => DesignNotifier(),
      child: AppStarter(),
    );
  }
}

class AppStarter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider(create: (_) => AuthService.user),
        ChangeNotifierProvider(create: (_) => AppState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<DesignNotifier>(context).theme,
        home: AppRouter(),
      ),
    );
  }
}
