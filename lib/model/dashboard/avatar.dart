class Avatar {
  String _href;

  Avatar(parsedJson) {
    _href = parsedJson['href'];

  }

  String get href => _href;

  set href(String value) {
    _href = value;
  }
}