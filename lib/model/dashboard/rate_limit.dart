class RateLimit {
  int _limit;
  int _remaining;
  int _reset;

  RateLimit(parsedJson) {
    _limit = parsedJson['limit'];
    _remaining = parsedJson['remaining'];
    _reset = parsedJson['reset'];

  }

  int get limit => _limit;

  set limit(int value) {
    _limit = value;
  }

  int get remaining => _remaining;

  set remaining(int value) {
    _remaining = value;
  }

  int get reset => _reset;

  set reset(int value) {
    _reset = value;
  }


}