import 'dart:convert';

import 'package:flutter/cupertino.dart';


class Login {
  String email;
  String password;
  String id;

  Login(
      {@required this.password, @required this.email, @required this.id});

  String toJSON() {
    Map<String, String> mapped = {
      'email': email,
      'password': password,
    };
    return json.encode(mapped);
  }
}
