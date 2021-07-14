import 'package:chat_app/constants/controllers.dart';
import 'package:chat_app/controllers/chat_controller.dart';
import 'package:chat_app/screens/chat/widgets/chat_appbar_tittle_widget.dart';
import 'package:chat_app/screens/chat/widgets/chat_bar_widget.dart';
import 'package:chat_app/screens/chat/widgets/chat_popup_menu_widget.dart';
import 'package:chat_app/screens/chat/widgets/message_list_widget.dart';
import 'package:chat_app/screens/chat/widgets/scroll_to_bottom_widget.dart';
import 'package:chat_app/screens/chat/widgets/statefull_wrapper_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  final _chatController = Get.put(ChatController());
  //final ChatController _chatController = Get.find();
  static const String routeNamed = "/chat";
  ChatScreen({Key? key}) : super(key: key);

  void onStart() {
    final args = Get.arguments;
    switch (args['type']) {
      case 'chat':
        _chatController.fetchChat(type: 'by-id', value: args['id']);
        break;
      case 'user':
        _chatController.fetchChat(
            type: 'by-member-ids',
            value: [authController.user.value!.id, args['id']]);
        break;
      case 'group':
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return StateFullWrapperWidget(
      onInit: onStart,
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: ChatAppBarTitleWidget(),
          actions: [ChatPopupMenuWidget()],
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              // message list
              Expanded(
                child: Stack(
                  children: [
                    MessageListWidget(),
                    ScrollToBottomWidget(),
                  ],
                ),
              ),

              // chat bar
              ChatBarWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
