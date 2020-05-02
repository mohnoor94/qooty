import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qooty/screens/app_router.dart';
import 'package:qooty/services/auth_service.dart';
import 'package:qooty/values/colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      create: (_) => AuthService.user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          canvasColor: AppColors.main,
          accentColor: AppColors.main,
          backgroundColor: AppColors.background,
        ),
        home: AppRouter(),
      ),
    );
  }
}
