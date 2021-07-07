import 'package:chat_app/constants/my_icon.dart';
import 'package:chat_app/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatBarWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ChatBarWidgetState();
  }
}

class _ChatBarWidgetState extends State {
  ChatController chatController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildChatMsgBar(context),
        buildChatActionBar(context),
      ],
    );
  }

  buildChatMsgBar(context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Container(
              child: TextField(
                maxLines: null,
                onChanged: (value) {
                  setState(() {});
                },
                controller: chatController.msgController.value,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 5.0),
                  hintText: "Type...",
                  border: OutlineInputBorder(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  buildChatActionBar(context) {
    return ButtonBar(
      buttonPadding: EdgeInsets.all(0),
      children: chatController.msgController.value.text.trim() != ""
          ? [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  SEND_ICON,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ]
          : [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  ATTACK_FILE_ICON,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  MIC_ICON,
                ),
              ),
            ],
    );
  }
}
