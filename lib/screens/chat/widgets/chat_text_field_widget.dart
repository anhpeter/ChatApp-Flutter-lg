import 'package:chat_app/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatTextFieldWidget extends StatelessWidget {
  final ChatController chatController = Get.find();
  ChatTextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      //onTap: () {
        //chatController.scrollToBottom();
      //},
      maxLines: null,
      onChanged: (value) {},
      controller: chatController.msgController.value,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
        hintText: "Type...",
        border: OutlineInputBorder(),
      ),
    );
  }
}
