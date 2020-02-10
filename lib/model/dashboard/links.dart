import 'package:flutter_prueba/model/dashboard/avatar.dart';
import 'package:flutter_prueba/model/dashboard/edit.dart';
import 'package:flutter_prueba/model/dashboard/self.dart';

class Links {

  Self _self;
  Edit _edit;
  Avatar _avatar;

  Links(parsedJson) {
    _self = Self(parsedJson['self']);
    _edit = Edit(parsedJson['edit']);
    _avatar = Avatar(parsedJson['avatar']);

  }

  Self get self => _self;

  set self(Self value) {
    _self = value;
  }

  Edit get edit => _edit;

  set edit(Edit value) {
    _edit = value;
  }

  Avatar get avatar => _avatar;

  set avatar(Avatar value) {
    _avatar = value;
  }

}