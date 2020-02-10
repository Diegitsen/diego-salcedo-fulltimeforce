import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_prueba/model/usuario/login.dart';
import 'package:flutter_prueba/model/usuario/usuario.dart';
import 'package:flutter_prueba/persistance/login_controlador.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_prueba/persistance/api_provider.dart';
import 'package:http/http.dart';

class Autenticacion with ChangeNotifier {
  Usuario userData;
  Login savedUserCredentials;
  static LoginControlador _authController = LoginControlador();
  String initialPage;

  AuthService() {
    getUserSavedCredentials();
  }

  getUserSavedCredentials() async {
    Login userCredentials =
    await _authController.getUserSavedCredentials();
    if (userCredentials != null) {
      savedUserCredentials = userCredentials;
      initialPage = 'dashboard';

      Response response = await get(loginEndpoint(savedUserCredentials),
          headers: getBasicHeaders());
      userData = Usuario.fromJSON(json.decode(response.body)['result'][0]);
      notifyListeners();
    }
  }

  Future<bool> loginUser(
      {Login credentials, bool shouldSave = false}) async {
    try {
      Response response =
      await get(loginEndpoint(credentials), headers: getBasicHeaders());
      /* print(response.body); */
      userData = Usuario.fromJSON(json.decode(response.body)['result'][0]);
      bool saved = await _authController.saveUserCredentials(credentials);
      if (saved) {
        await Fluttertoast.cancel();
        Fluttertoast.showToast(msg: 'Exito al loguearse');
      } else {
        await Fluttertoast.cancel();
        Fluttertoast.showToast(msg: 'Error');
      }
      return true;
    } catch (e) {
      await Fluttertoast.cancel();
      Fluttertoast.showToast(msg: 'Cant login. Try again later');
      return false;
    }
  }

  Future<bool> registerUser({Usuario user, bool shouldSave = false}) async {
    try {
      Response response = await post(registerEndpoint(),
          body: user.toJSON(), headers: getBasicHeaders());
      userData = Usuario.fromJSON(json.decode(response.body)['result']);
      notifyListeners();
      bool saved =
      await _authController.saveUserCredentials(user.toCredentials());
      if (saved) {
        await Fluttertoast.cancel();
        Fluttertoast.showToast(msg: 'Exito al registrarse');
      } else {
        await Fluttertoast.cancel();
        Fluttertoast.showToast(msg: 'Error');
      }
      return true;
    } catch (e) {
      await Fluttertoast.cancel();
      Fluttertoast.showToast(msg: 'Error ocurred try again later: $e');
      return false;
    }
  }

  updateUserData(Usuario newUserData) async {
    try {
      Response response = await patch(updateEndpoint(newUserData),
          body: newUserData.toJSON(), headers: getBasicHeaders());
      userData = Usuario.fromJSON(json.decode(response.body)['result']);
      notifyListeners();
      bool saved = await _authController
          .saveUserCredentials(newUserData.toCredentials());
      if (saved) {
        await Fluttertoast.cancel();
        Fluttertoast.showToast(msg: 'Exito al actualizar los datos');
      } else {
        await Fluttertoast.cancel();
        Fluttertoast.showToast(msg: 'Error');
      }
      return true;
    } catch (e) {
      await Fluttertoast.cancel();
      Fluttertoast.showToast(msg: 'Error ocurred try again later: $e');
      return false;
    }
  }
}
