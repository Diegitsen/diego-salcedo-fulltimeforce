class Edit {
  String _href;

  Edit(parsedJson) {
    _href = parsedJson['href'];

  }

  String get href => _href;

  set href(String value) {
    _href = value;
  }
}