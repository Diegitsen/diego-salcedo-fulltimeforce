

import 'package:flutter_prueba/model/usuario/login.dart';
import 'package:flutter_prueba/model/usuario/usuario.dart';

String loginEndpoint(Login credentials) {
  return 'https://gorest.co.in/public-api/users?email=${credentials.email}&access-token=zmSREIpxH5DCVw4ULglIYfNTWiTRZpvKLKZd';
  //https://gorest.co.in/public-api/users?_format=json&email=beverly99@example.org&access-token=zmSREIpxH5DCVw4ULglIYfNTWiTRZpvKLKZd
}

String registerEndpoint() {
  return 'https://gorest.co.in/public-api/users?access-token=zmSREIpxH5DCVw4ULglIYfNTWiTRZpvKLKZd';
}

String updateEndpoint(Usuario credentials) {
  return 'https://gorest.co.in/public-api/users/${credentials.id}?&access-token=zmSREIpxH5DCVw4ULglIYfNTWiTRZpvKLKZd';
}

/// Basic JSON Headers
Map<String, String> getBasicHeaders() {
  return {
    'Content-Type': 'application/json',
  };
}
