import 'package:chat_app/constants/my_icon.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/screens/chat/chat_screen.dart';
import 'package:chat_app/widgets/all_user_list_widget.dart';
import 'package:chat_app/widgets/block_title_widget.dart';
import 'package:chat_app/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewMessageScreen extends StatefulWidget {
  static const String routeNamed = "/new-message";
  NewMessageScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _NewMessageScreenState();
  }
}

class _NewMessageScreenState extends State {
  bool isSearchMode = false;

  @override
  Widget build(BuildContext context) {
    var textStyle =
        TextStyle(color: Theme.of(context).primaryTextTheme.subtitle1!.color);
    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          buildNewMessageOptionBlock(),
          const BlockTitleWidget(
            title: "Sorted by name",
          ),
          Expanded(
            child: AllUserListWidget(
              callback: (User item) {
                Get.toNamed(ChatScreen.routeNamed, arguments: {
                  'type': 'user',
                  'id': item.id,
                });
              },
            ),
          )
        ],
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      leading: BackButton(
        onPressed: () {
          if (isSearchMode) {
            setState(() {
              isSearchMode = false;
            });
          } else
            Get.back();
        },
      ),
      title: !isSearchMode ? Text("New message") : SearchBarWidget(),
      actions: !isSearchMode
          ? [
              IconButton(
                  onPressed: () {
                    setState(() => isSearchMode = true);
                  },
                  icon: Icon(SEARCH_ICON)),
              IconButton(onPressed: () {}, icon: Icon(SORT_ICON)),
            ]
          : [],
    );
  }

  buildNewMessageOptionBlock() {
    return Column(
      children: [
        ListTile(
          title: Text("New Group"),
          leading: Icon(GROUP_ICON),
          onTap: () {},
        )
      ],
    );
  }
}
