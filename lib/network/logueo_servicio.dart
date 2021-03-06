import 'package:flutter/material.dart';
import 'package:flutter_prueba/model/usuario/login.dart';
import 'package:flutter_prueba/network/autenticacion.dart';
import 'package:flutter_prueba/ui/dashboard/dashboard_page.dart';
import 'package:flutter_prueba/ui/signup/sign_up_page.dart';
import 'package:provider/provider.dart';

class LoginPageService with ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginPageService(BuildContext context) {
    Autenticacion authService = Provider.of<Autenticacion>(context, listen: false);
    if (authService.savedUserCredentials != null) {
      emailController =
          TextEditingController(text: authService.savedUserCredentials.email);
      passwordController = TextEditingController(
          text: authService.savedUserCredentials.password);
      validated = true;
    } else {
      emailController = TextEditingController();
      passwordController = TextEditingController();
      validated = false;
    }
  }
  bool validated;

  bool validatePW({String textbase}) {
    String text = textbase ?? passwordController.text;
    /* String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[!@#\$&*~]).{8,}$'; */
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(text);
  }

  bool validateEmail({String textbase}) {
    bool validation = true;
    String text = textbase ?? emailController.text;
    bool basicValidation = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
        .hasMatch(text);
    if (basicValidation) {
      int firstSplit = text.indexOf('@');
      int secondSplit = text.lastIndexOf('.');
      if (secondSplit - firstSplit <= 3 || secondSplit == -1) {
        validation = false;
      }
      if (text.length - secondSplit <= 2 + 1) {
        validation = false;
      }
    } else {
      validation = false;
    }
    return validation;
  }

  validate({bool signupview = true}) {
    bool email = validateEmail();
    bool password = validatePW();
    validated = email && password;
    notifyListeners();
  }

  authenthicate(BuildContext context) async {
    Autenticacion authService = Provider.of<Autenticacion>(context, listen: false);
    Login credentials = Login(
      email: emailController.text,
      password: passwordController.text,
      id: '',
    );
    bool response = await authService.loginUser(credentials: credentials);
    if (response) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => DashboardPage(),
        ),
      );
    }
  }

  goToSignUp(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SignUpPage(),
      ),
    );
  }
}
