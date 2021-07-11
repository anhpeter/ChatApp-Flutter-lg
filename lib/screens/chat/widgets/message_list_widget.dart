import 'package:chat_app/constants/controllers.dart';
import 'package:chat_app/constants/me.dart';
import 'package:chat_app/controllers/chat_controller.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/screens/chat/widgets/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageListWidget extends StatelessWidget {
  MessageListWidget({Key? key}) : super(key: key);
  ChatController chatController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return chatController.isLoading == true
          ? Center(child: CircularProgressIndicator())
          : buildMessageList();
    });
  }

  buildMessageList() {
    return chatController.chat.value.messages.length == 0
        ? Center(
            child: Text("No message yet"),
          )
        : SingleChildScrollView(
            child: Column(
              children: chatController.chat.value.messages
                  .map(
                    (item) => MessageWidget(
                      isMe: item.senderId == authController.user.value!.id,
                      message: item,
                    ),
                  )
                  .toList(),
            ),
          );
  }
}
