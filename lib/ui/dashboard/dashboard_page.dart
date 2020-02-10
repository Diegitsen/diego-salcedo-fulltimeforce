import 'package:flutter/material.dart';
import 'package:flutter_prueba/bloc/list_bloc.dart';
import 'package:flutter_prueba/model/dashboard/usuario_lista.dart';
import 'package:flutter_prueba/network/chat_servicio.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    listBloc.fetchUsers();

    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => ChatService(),
      )
    ], child: DashboardPageBase());
  }
}

class DashboardPageBase extends StatelessWidget {
  const DashboardPageBase({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatService chatService = Provider.of<ChatService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () => chatService.goToSettings(context),
            icon: Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () => chatService.goToChat(context),
            icon: Icon(Icons.message),
          ),
        ],
      ),
      body: Column(
      ),
    );
  }

  Container _buildUser(UsuarioRaw data) {
    return Container(
      padding: const EdgeInsets.all(17.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildTitle(data.result.length.toString()),
        ],
      ),
    );
  }

  Center _buildTitle(String name) {
    return Center(
      child: Text(
        "len " + name,
        style:
        TextStyle(color: Color.fromRGBO(0, 123, 174, 100), fontSize: 40.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}


/*import 'package:flutter/material.dart';
import 'package:flutter_prueba/bloc/list_bloc.dart';
import 'package:flutter_prueba/model/dashboard/usuario_lista.dart';
import 'package:intl/intl.dart';*/

/*
class DashboardPage extends StatefulWidget {
  @override
  DashboardPageState createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {

    listBloc.fetchUsers();

    return StreamBuilder(
        stream: listBloc.list,
        builder: (context, AsyncSnapshot<UsuarioRaw> snapshot) {
          if (snapshot.hasData) {
            return _buildUserList(snapshot.data);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        });
  }*/
/*
  Container _buildUserList(UsuarioRaw data) {
    return Container(
      padding: const EdgeInsets.all(17.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildTitle(data.result.length.toString())
        ],
      ),
    );
  }

  Center _buildTitle(String name) {
    return Center(
      child: Text(
        "Nombre " + name,
        style:
        TextStyle(color: Color.fromRGBO(0, 123, 174, 100), fontSize: 40.0),
        textAlign: TextAlign.center,
      ),
    );
  }

}

nPressed: () => chatService.goToSettings(context),
appBar: AppBar(
title: Text('Dashboard'),
centerTitle: true,
actions: <Widget>[
IconButton(
onPressed: () => chatService.goToSettings(context),
icon: Icon(Icons.settings),
)
],
),*/