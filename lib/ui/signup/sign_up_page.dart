import 'package:flutter/material.dart';
import 'package:flutter_prueba/network/deslogueo_servicio.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => SignUpPageService(),
      ),
    ], child: SingUpPageBase());
  }
}

class SingUpPageBase extends StatelessWidget {
  const SingUpPageBase({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpPageService loginService = Provider.of<SignUpPageService>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'SIGNUP',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.black.withOpacity(0.6),
                fontSize: 35,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: loginService.usernameController,
              onChanged: (value) => loginService.validate(),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Username',
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
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: loginService.imageController,
              onChanged: (value) => loginService.validate(),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Photo',
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
            child: Text('SignUp'),
            onPressed: loginService.validated
                ? () => loginService.register(context)
                : null,
          ),
          FlatButton(
            color: Colors.deepPurple,
            textColor: Colors.white,
            disabledColor: Colors.grey,
            disabledTextColor: Colors.white,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.blueAccent,
            child: Text('GoToLogin'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
