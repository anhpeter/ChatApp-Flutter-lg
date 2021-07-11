import 'package:chat_app/constants/controllers.dart';
import 'package:chat_app/controllers/chat_controller.dart';
import 'package:chat_app/models/chat.dart';
import 'package:chat_app/models/chat_user.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/screens/chat/widgets/chat_bar_widget.dart';
import 'package:chat_app/screens/chat/widgets/chat_popup_menu_widget.dart';
import 'package:chat_app/screens/chat/widgets/message_list_widget.dart';
import 'package:chat_app/screens/chat/widgets/statefull_wrapper_widget.dart';
import 'package:chat_app/widgets/my_circle_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  final chatController = Get.put(ChatController());
  static const String routeNamed = "/chat";
  ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onStart() {
      final args = Get.arguments;
      switch (args['type']) {
        case 'chat':
          break;
        case 'user':
          chatController.fetchChatByMemberIds(
              [authController.user.value!.id, args['id']]);
          break;
        case 'group':
          break;
        default:
      }
    }

    return StateFullWrapperWidget(
      callback: onStart,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Obx(() {
            // loading
            if (chatController.isLoading.value) return Text("Loading ...");

            // success
            if (chatController.error == null) {
              User friend = chatController.chat.value.members.singleWhere(
                  (item) => item.id != authController.user.value!.id);
              return ListTile(
                leading: MyCircleAvatarWidget(imageUrl: friend.avatarUrl),
                title: Text(friend.username,
                    style: Theme.of(context).primaryTextTheme.headline6),
                subtitle: Text("Last seen recently",
                    style: Theme.of(context).primaryTextTheme.subtitle2),
              );
            }

            // error
            return Text("Something went wrong");
          }),
          actions: [ChatPopupMenuWidget()],
        ),
        body: Column(
          children: [
            // message list
            Expanded(
              child: Container(
                child: MessageListWidget(),
              ),
            ),

            // chat bar
            ChatBarWidget(),
          ],
        ),
      ),
    );
  }
}
