import 'package:flutter/material.dart';
import 'package:flutter_prueba/network/logueo_servicio.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => LoginPageService(context),
      ),
    ], child: LoginPageBase());
  }
}

class LoginPageBase extends StatelessWidget {
  const LoginPageBase({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    LoginPageService loginService = Provider.of<LoginPageService>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'FLUTTER FULLTIMEFORCE',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.black.withOpacity(0.6),
                fontSize: 35,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: loginService.emailController,
              onChanged: (value) => loginService.validate(),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: loginService.passwordController,
              obscureText: true,
              onChanged: (value) => loginService.validate(),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
            ),
          ),
          FlatButton(
            color: Colors.deepPurple,
            textColor: Colors.white,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.white,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.blueAccent,
            child: Text('Login'),
            onPressed: loginService.validated
                ? () => loginService.authenthicate(context)
                : null,
          ),
          FlatButton(
            color: Colors.deepPurple,
            textColor: Colors.white,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.white,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.blueAccent,
            child: Text('Register'),
            onPressed: () => loginService.goToSignUp(context),
          ),
        ],
      ),
    );
  }
}
