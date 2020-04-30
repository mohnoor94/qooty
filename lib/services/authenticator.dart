import 'package:firebase_auth/firebase_auth.dart';

abstract class Authenticator {}

class FirebaseAuthenticator {
  static final _auth = FirebaseAuth.instance;
  static var _user;

  static Future<bool> signIn() async {
    if (isSignedIn) return true;
    _user = await _auth.signInAnonymously();
    return isSignedIn;
  }

  static Future<void> signOut() async {
    return await _auth.signOut();
  }

  static bool get isSignedIn => _user != null;
}
