import 'package:chat_app/constants/controllers.dart';
import 'package:chat_app/constants/me.dart';
import 'package:chat_app/controllers/chat_controller.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/screens/chat/widgets/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageListWidget extends StatelessWidget {
  final ChatController chatController = Get.find();
  MessageListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      print('message list build()');
      if (!chatController.isLoading.value) {
        print(chatController.chat.value.messages);
      }
      return chatController.isLoading.value == true
          ? Center(child: CircularProgressIndicator())
          : buildMessageList(context);
    });
  }

  buildMessageList(context) {
    return chatController.chat.value.messages.length == 0
        ? Center(
            child: Text(
              "Say Hi :)",
              style: Theme.of(context).textTheme.headline6,
            ),
          )
        : ListView.builder(
            reverse: true,
            controller: chatController.scrollController,
            itemCount: chatController.chat.value.messages.length,
            itemBuilder: (_, index) {
              var index$ =
                  (index + 1 - chatController.chat.value.messages.length).abs();
              var item = chatController.chat.value.messages[index$];
              return MessageWidget(
                isMe: item.sender.id == authController.user.value!.id,
                message: item,
              );
            },
          );
  }
}
