import 'package:flutter_prueba/model/usuario/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginControlador {

  Future<Login> getUserSavedCredentials() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    List<String> currentKeys = shared.getKeys().toList();
    if (!currentKeys.contains('email') || !currentKeys.contains('password')) {
      return null;
    } else {
      return Login(
        email: shared.getString('email'),
        password: shared.getString('password'),
        id: shared.getString('id'),
      );
    }
  }


  Future<bool> saveUserCredentials(Login credentials) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    bool emailSaved = await shared.setString('email', credentials.email);
    bool passwordSaved =
    await shared.setString('password', credentials.password);
    bool id = await shared.setString('id', credentials.id);
    return emailSaved && passwordSaved && id;
  }
}
