import 'package:chat_app/common/Helper.dart';
import 'package:chat_app/constants/config.dart';
import 'package:chat_app/constants/my_icon.dart';
import 'package:chat_app/screens/global_search/global_search_screen.dart';
import 'package:chat_app/screens/new_message/new_message.screen.dart';
import 'package:chat_app/widgets/chat_list_widget.dart';
import 'package:chat_app/widgets/main_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  static const String routeNamed = "/home";
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawerWidget(),
      appBar: AppBar(
        title: Text(APP_NAME),
        actions: [
          IconButton(
              onPressed: () {
                Helper.showSnackbar(context, "Clock...");
              },
              icon: Icon(CLOCK_ICON)),
          IconButton(
              onPressed: () {
                Get.toNamed(GlobalSearchScreen.routeNamed);
              },
              icon: Icon(SEARCH_ICON)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(NewMessageScreen.routeNamed);
        },
        child: Icon(EDIT_ICON),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(child: ChatListWidget()),
          ],
        ),
      ),
    );
  }
}
