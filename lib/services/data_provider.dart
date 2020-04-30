import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qooty/models/quote.dart';
import 'package:qooty/services/authenticator.dart';

abstract class DataProvider {}

class FirestoreDataProvider extends DataProvider {
  static const String quotesTable = 'quotes';
  static const String quoteText = 'text';
  static const String quoteWriter = 'writer';

  static final _firestore = Firestore.instance;

  static Future<List<Quote>> getQuotes() async {
    if (!FirebaseAuthenticator.isSignedIn) await FirebaseAuthenticator.signIn();

    QuerySnapshot querySnapshot = await _firestore.collection(quotesTable).getDocuments();
    return querySnapshot.documents
        .map((q) => Quote(text: q.data[quoteText], writer: q.data[quoteWriter] ?? 'Unknown'))
        .toList();
  }
}
