
import 'package:flutter_prueba/model/dashboard/rate_limit.dart';

class Meta {
  bool _success;
  int _code;
  String _message;
  int _totalCount;
  int _pageCount;
  int _currentPage;
  int _perPage;
  RateLimit _rateLimit;

  Meta(parsedJson) {
    _success = parsedJson['success'];
    _code = parsedJson['code'];
    _message = parsedJson['message'];
    _totalCount = parsedJson['totalCount'];
    _pageCount = parsedJson['pageCount'];
    _currentPage = parsedJson['currentPage'];
    _perPage = parsedJson['perPage'];
    _rateLimit = RateLimit(parsedJson['rateLimit']);
  }

  bool get success => _success;

  set success(bool value) {
    _success = value;
  }

  int get code => _code;

  set code(int value) {
    _code = value;
  }

  String get message => _message;

  set message(String value) {
    _message = value;
  }

  int get totalCount => _totalCount;

  set totalCount(int value) {
    _totalCount = value;
  }

  int get pageCount => _pageCount;

  set pageCount(int value) {
    _pageCount = value;
  }

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
  }

  int get perPage => _perPage;

  set perPage(int value) {
    _perPage = value;
  }

  RateLimit get rateLimit => _rateLimit;

  set rateLimit(RateLimit value) {
    _rateLimit = value;
  }
}
