import 'package:chat_app/screens/chat/chat_screen.dart';
import 'package:chat_app/screens/home/home_screen.dart';
import 'package:chat_app/screens/setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Peter Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomeScreen.routeNamed,
      getPages: [
        GetPage(name: HomeScreen.routeNamed, page: () => HomeScreen()),
        GetPage(name: SettingScreen.routeNamed, page: () => SettingScreen()),
        GetPage(name: ChatScreen.routeNamed, page: () => ChatScreen()),
      ],
    );
  }
}
