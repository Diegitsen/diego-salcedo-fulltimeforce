import 'package:flutter_prueba/model/dashboard/usuario_lista.dart';
import 'package:flutter_prueba/persistance/repository_list.dart';
import 'package:rxdart/rxdart.dart';

class ListBloc {
  RepositoryList _repository = RepositoryList();

  final _listFetcher = PublishSubject<UsuarioRaw>();

  Observable<UsuarioRaw> get list => _listFetcher.stream;

  fetchUsers() async {
    print("bloc 123456");
    UsuarioRaw usuario = await _repository.fetchUsers();
    print("user");
    print(usuario.result.length);
    _listFetcher.sink.add(usuario);
  }

  dispose() {
    _listFetcher.close();
  }
}

final listBloc = ListBloc();