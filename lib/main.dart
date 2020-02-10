import 'package:flutter/material.dart';
import 'package:flutter_prueba/network/autenticacion.dart';
import 'package:flutter_prueba/ui/dashboard/dashboard_page.dart';
import 'package:flutter_prueba/ui/login/login_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Autenticacion authService = Autenticacion();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: authService,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Test',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: BaseRouter(),
      ),
    );
  }
}

class BaseRouter extends StatefulWidget {
  BaseRouter({Key key}) : super(key: key);

  @override
  _BaseRouterState createState() => _BaseRouterState();
}

class _BaseRouterState extends State<BaseRouter> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 500)).then(
          (val) => goToNextPage(),
    );
  }

  goToNextPage() {
    Autenticacion authService = Provider.of<Autenticacion>(context, listen: false);
    switch (authService.initialPage) {
      case 'dashboard':
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => DashboardPage(),
          ),
        );
        break;
      default:
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: CircularProgressIndicator(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Welcome'),
          ),
        ],
      ),
    );
  }
}