import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qooty/values/keys.dart';

class User {
  final String id;
  final String name;
  final String username;
  final String email;
  final String twitter;
  final bool deactivated;
  final List<int> likes;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.twitter,
    this.deactivated,
    this.likes,
  });

  User.id(this.id)
      : name = null,
        username = null,
        email = null,
        twitter = null,
        deactivated = false,
        likes = [];

  User.name({this.id, this.name})
      : username = null,
        email = null,
        twitter = null,
        deactivated = false,
        likes = [];

  static User fromFirebaseUser(FirebaseUser fbu) => fbu == null ? null : User.id(fbu.uid);

  static User fromDocumentSnapshot(DocumentSnapshot snapshot) {
    if (snapshot == null || snapshot.data == null) return null;

    var likes = snapshot.data[UserKeys.likes];
    likes = likes == null || (likes is List && likes.length == 0) ? List<int>() : likes;

    return User(
      id: snapshot.data[UserKeys.uid],
      name: snapshot.data[UserKeys.name],
      username: snapshot.data[UserKeys.username],
      email: snapshot.data[UserKeys.email],
      twitter: snapshot.data[UserKeys.twitter],
      deactivated: snapshot.data[UserKeys.deactivated],
      likes: likes,
    );
  }

  void likeQuote(int quoteId) => likes.add(quoteId);
  void unlikeQuote(int quoteId) => likes.remove(quoteId);

  @override
  String toString() {
    return 'User{id: $id, name: $name, username: $username, email: $email, twitter: $twitter, deactivated: $deactivated, likes: $likes}';
  }
}
