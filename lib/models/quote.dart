import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qooty/values/keys.dart';

class Quote {
  final int id;
  final String text;
  final String writer;
  bool liked;

  Quote({
    this.id,
    this.text,
    String writer,
  })  : writer = writer == null ? 'Unknown' : writer,
        liked = false;

  Quote.dummy()
      : id = -1,
        text = '',
        writer = '',
        liked = false;

  static Quote fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return snapshot == null || snapshot.data == null
        ? null
        : Quote(
            id: snapshot.data[QuoteKeys.id],
            text: snapshot.data[QuoteKeys.text],
            writer: snapshot.data[QuoteKeys.writer],
          );
  }

  String get strId => id.toString();

  void like() => liked = true;

  bool toggelLike() => liked = !liked;

  @override
  String toString() => '$text\n\n- $writer';
}
