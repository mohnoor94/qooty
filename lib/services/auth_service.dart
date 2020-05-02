import 'package:firebase_auth/firebase_auth.dart';
import 'package:qooty/models/user.dart';
import 'package:qooty/services/data_manager.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static User _user;

  static Future<User> signInAnonymously() async {
    if (_isSignedIn()) return _user;
    try {
      _user = User.fromFirebaseUser(await _auth.currentUser());
      if (_isSignedIn()) return _user;

      final result = await _auth.signInAnonymously();
      _user = User.fromFirebaseUser(result.user);
      return _user;
    } catch (operationNotAllowedError) {
      print(operationNotAllowedError);
      return null;
    }
  }

  static Stream<User> get user => _auth.onAuthStateChanged.map((u) => u.uid).asyncMap(DataManager.registerUser);

  static Future<void> signOut() async {
    _user = null;
    return await _auth.signOut();
  }

  static bool _isSignedIn() => _user != null && _user.id != null;
}
