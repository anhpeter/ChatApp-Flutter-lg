import 'package:chat_app/constants/controllers.dart';
import 'package:chat_app/controllers/chat_list_controller.dart';
import 'package:chat_app/models/chat_in_list.dart';
import 'package:chat_app/screens/chat/widgets/statefull_wrapper_widget.dart';
import 'package:chat_app/widgets/center_message_widget.dart';
import 'package:chat_app/widgets/chat_exerpt_widget.dart';
import 'package:chat_app/widgets/error_message_widget.dart';
import 'package:chat_app/widgets/my_circlular_progress_widget.dart';
import 'package:chat_app/widgets/notify_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatListWidget extends StatelessWidget {
  ChatListWidget({Key? key}) : super(key: key);
  final ChatListController _chatListController = Get.find();

  void onStart() {
    _chatListController.fetchChatList(authController.user.value!.id);
  }

  @override
  Widget build(BuildContext context) {
    return StateFullWrapperWidget(
        onInit: onStart,
        child: Obx(() {
          if (_chatListController.isLoading.value)
            return MyCircularProgressWidget();
          else if (_chatListController.error != null) {
            return ErrorMessageWidget();
          }

          return buildChatList();
        }));
  }

  buildChatList() {
    if (_chatListController.chatList.length == 0)
      return const CenterMessgaeWidget(text: 'Let\'s chat :)');
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) {
        ChatInList item = _chatListController.chatList[index];
        return ChatExcerptWidget(item: item);
      },
      itemCount: _chatListController.chatList.length,
    );
  }
}
