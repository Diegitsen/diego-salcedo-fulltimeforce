
import 'package:flutter_prueba/model/dashboard/links.dart';

class Result{
  int _id;
  String _first_name;
  String _last_name;
  String _gender;
  String _dob;
  String _email;
  String _phone;
  String _website;
  String _address;
  Links _links;


  Result(parsedJson) {
    _id = parsedJson['id'];
    _first_name = parsedJson['first_name'];
    _last_name = parsedJson['last_name'];
    _gender = parsedJson['gender'];
    _dob = parsedJson['dob'];
    _email = parsedJson['email'];
    _phone = parsedJson['phone'];
    _website = parsedJson['website'];
    _address = parsedJson['address'];
    //CHECK THIS
    _links = Links(parsedJson['_links']);
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get first_name => _first_name;

  set first_name(String value) {
    _first_name = value;
  }

  String get last_name => _last_name;

  set last_name(String value) {
    _last_name = value;
  }

  String get gender => _gender;

  set gender(String value) {
    _gender = value;
  }

  String get dob => _dob;

  set dob(String value) {
    _dob = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get phone => _phone;

  set phone(String value) {
    _phone = value;
  }

  String get website => _website;

  set website(String value) {
    _website = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  Links get links => _links;

  set rateLimit(Links value) {
    _links = value;
  }


}