import 'package:flutter/material.dart';

import 'package:qooty/services/auth_service.dart';
import 'package:qooty/widgets/loading.dart';

class AuthenticationScreen extends StatelessWidget {
  Future<void> signIn() async {
    await AuthService.signInAnonymously();
  }

  @override
  Widget build(BuildContext context) {
    signIn();
    return Center(
      child: Loading(),
    );
  }
}
