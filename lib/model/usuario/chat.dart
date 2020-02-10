import 'package:flutter/cupertino.dart';

/// Modelo creado en base al modelo de mensajes emitidos por el servidor del proyecto de prueba
class Chat {
  String message;
  String username;

  Chat({
    @required this.username,
    @required this.message,
  });

  factory Chat.fromJSON(json) {
    return Chat(
      message: json['message'] ?? 'nomsg',
      username: json['username'] ?? 'nouser',
    );
  }
}
