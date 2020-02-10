import 'dart:convert';
import 'package:flutter_prueba/model/dashboard/usuario_lista.dart';
import 'package:http/http.dart' show Client;

class ApiProviderList {
  Client client = Client();
  final _baseUrl =
      "https://gorest.co.in/public-api/users?_format=json&email=beverly99@example.org&access-token=zmSREIpxH5DCVw4ULglIYfNTWiTRZpvKLKZd";

  Future<UsuarioRaw> fetchUsers() async {
    final response = await client.get("$_baseUrl");
    print("api list");
    print(response.body.toString());

    if (response.statusCode == 200) {
      print("status code 200");
      print(json.decode(response.body));
      return UsuarioRaw.fromJson(json.decode(response.body));
    } else {
      throw Exception('Falla al cargar usuarios');
    }
  }
}