
import 'package:flutter_prueba/model/dashboard/meta.dart';

import 'package:flutter_prueba/model/dashboard/result.dart';

class UsuarioRaw{

  List<Meta> _meta;
  List<Result> _result;

  UsuarioRaw.fromJson(Map<String, dynamic> parsedJson) {

    List<Meta> meta = [];
    for (int i = 0; i < parsedJson['_meta'].length; i++) {
      Meta results = Meta(parsedJson['_meta'][i]);
      meta.add(results);
    }

    List<Result> result = [];
    for (int i = 0; i < parsedJson['result'].length; i++) {
      Result results = Result(parsedJson['result'][i]);
      result.add(results);
    }

  }

  List<Result> get result => _result;

  set result(List<Result> value) {
    _result = value;
  }

  List<Meta> get meta => _meta;

  set meta(List<Meta> value) {
    _meta = value;
  }

}