import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qooty/models/quote.dart';
import 'package:qooty/models/user.dart';
import 'package:qooty/values/keys.dart';

class DataManager {
  static final _firestore = Firestore.instance;
  static final usersCollection = _firestore.collection(UserKeys.table);
  static final quotesCollection = _firestore.collection(QuoteKeys.table);
  static User _user;

  static Future<User> registerUser(String uid) async {
    final ref = usersCollection.document(uid);
    await ref.setData(
      {UserKeys.uid: uid},
      merge: true,
    );
    final snapshot = await ref.get();
    _user = User.fromDocumentSnapshot(snapshot);
    return _user;
  }

  static Future<void> updateUser(User user) async {
    return await usersCollection.document(user.id).setData({
      UserKeys.name: user.name,
      UserKeys.username: user.username,
      UserKeys.email: user.email,
      UserKeys.twitter: user.twitter,
      UserKeys.deactivated: user.deactivated,
      UserKeys.likes: user.likes
    });
  }

  static Future<List<Quote>> getQuotes() async {
    QuerySnapshot querySnapshot = await quotesCollection.getDocuments();
    return querySnapshot.documents.map(Quote.fromDocumentSnapshot).toList();
  }

  static Future<void> updateLikes(Quote quote) async {
    if (_user == null) return;
    quote.liked ? _user.unlikeQuote(quote.id) : _user.likeQuote(quote.id);
    await usersCollection.document(_user.id).setData({'likes': _user.likes});
  }
}
