import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_prueba/model/usuario/login.dart';


/// Modelo con información básica y adicional de cada usuario
class Usuario {
  String username;
  String email;
  String password;
  String imageURL;
  String id;

  Usuario({
    @required this.email,
    @required this.imageURL,
    this.password,
    @required this.username,
    this.id,
  });

  factory Usuario.fromJSON(json) {
    return Usuario(
      username: json['first_name'] ?? 'None',
      email: json['email'] ?? 'None',
      password: json['password'] ?? 'None',
      imageURL: json['last_name'] ?? 'None',
      id: json['id'] ?? '',
    );
  }

  String toJSON() {
    Map<String, String> mapped = {
      'username': username,
      'email': email,
      'password': password,
      'first_name': username,
      'last_name': imageURL,
      'gender': 'male',
    };
    return json.encode(mapped);
  }

  Login toCredentials() {
    return Login(
      email: email,
      password: password,
      id: id,
    );
  }
}
