import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qooty/notifiers/design_notifier.dart';

import 'package:qooty/services/auth_service.dart';
import 'package:qooty/values/messeges.dart';
import 'package:qooty/widgets/loading.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> with SingleTickerProviderStateMixin {
  bool _showConnectionMessage = false;
  AnimationController _controller;
  Animation _animation;

  Future<void> signIn() async {
    await AuthService.signInAnonymously();
  }

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 6),
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _showConnectionMessage = true;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    signIn();
    final designer = Provider.of<DesignNotifier>(context, listen: false);
    _controller.forward();
    return Scaffold(
      backgroundColor: designer.colors.second,
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Loading(),
            SizedBox(height: 20),
            Visibility(
              visible: _showConnectionMessage,
              child: FadeTransition(
                child: Text(
                  Messages.notConnected,
                  textAlign: TextAlign.center,
                  style: designer.textStyle,
                ),
                opacity: _animation,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
