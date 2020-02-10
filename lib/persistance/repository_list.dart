import 'package:flutter_prueba/model/dashboard/usuario_lista.dart';
import 'package:flutter_prueba/persistance/api_provider_list.dart';

class RepositoryList {
  ApiProviderList appApiProvider = ApiProviderList();

  Future<UsuarioRaw> fetchUsers() => appApiProvider.fetchUsers();

}