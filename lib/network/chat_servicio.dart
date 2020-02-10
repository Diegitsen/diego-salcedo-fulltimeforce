
import 'package:flutter_prueba/ui/dashboard/chat_page.dart';
import 'package:flutter_prueba/ui/settings/settings_page.dart';
import 'package:flutter/material.dart';

class ChatService with ChangeNotifier {

  ChatService() {

  }

  goToSettings(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SettingsPage()));
  }

  goToChat(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => ChatPage()));
  }

}
