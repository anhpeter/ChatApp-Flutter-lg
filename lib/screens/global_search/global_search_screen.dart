import 'package:chat_app/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';

class GlobalSearchScreen extends StatelessWidget {
  static const String routeNamed = "/global-search";
  GlobalSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: SearchBarWidget(),
          bottom: TabBar(
            tabs: [
              Tab(text: "Chats"),
              Tab(text: "Media"),
              Tab(text: "Links"),
            ],
          ),
        ),
        body: Column(
          children: [Text("Content")],
        ),
      ),
    );
  }
}
