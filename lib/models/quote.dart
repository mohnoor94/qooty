class Quote {
  static int count = 0;

  int _id;
  String text;
  String writer;
  bool _loved;

  Quote({
    this.text,
    this.writer,
  })  : _id = ++count,
        _loved = false;

  Quote.loved({
    this.text,
    this.writer,
  })  : _id = ++count,
        _loved = true;

  void love() => _loved = true;

  int get id => _id;

  bool get loved => _loved;

  @override
  String toString() => 'Quote{text: $text, writer: $writer}';
}
