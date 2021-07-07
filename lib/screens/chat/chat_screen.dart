import 'package:chat_app/common/Helper.dart';
import 'package:chat_app/controllers/chat_controller.dart';
import 'package:chat_app/dummy/dummy_users.dart';
import 'package:chat_app/models/chat_in_list.dart';
import 'package:chat_app/screens/chat/widgets/chat_bar_widget.dart';
import 'package:chat_app/screens/chat/widgets/chat_popup_menu_widget.dart';
import 'package:chat_app/screens/chat/widgets/message_list_widget.dart';
import 'package:chat_app/widgets/main_drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  var chatController = Get.put(ChatController());
  static const String routeNamed = "/chat";
  ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final friendId = Get.arguments[0];
    final friend = dummyUsers.singleWhere((element) => element.id == friendId);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(friend.avatarUrl),
          ),
          title: Text(friend.username,
              style: Theme.of(context).primaryTextTheme.headline6),
          subtitle: Text("Last seen recently",
              style: Theme.of(context).primaryTextTheme.subtitle2),
        ),
        actions: [ChatPopupMenuWidget()],
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: MessageListWidget(),
              ),
            ),
            ChatBarWidget(),
          ],
        ),
      ),
    );
  }
}
