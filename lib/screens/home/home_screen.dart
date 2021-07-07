import 'package:chat_app/common/Helper.dart';
import 'package:chat_app/widgets/chat_list_widget.dart';
import 'package:chat_app/widgets/main_drawer_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeNamed = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawerWidget(),
      appBar: AppBar(
        title: Text("Peter Chat"),
        actions: [
          IconButton(
              onPressed: () {
                Helper.showSnackbar(context, "Clock...");
              },
              icon: Icon(Icons.lock)),
          IconButton(
              onPressed: () {
                Helper.showSnackbar(context, "Clock...");
              },
              icon: Icon(Icons.search)),
        ],
      ),
      body: ChatListWidget(),
    );
  }
}
