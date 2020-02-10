class Self {
  String _href;

  Self(parsedJson) {
    _href = parsedJson['href'];

  }

  String get href => _href;

  set href(String value) {
    _href = value;
  }
}