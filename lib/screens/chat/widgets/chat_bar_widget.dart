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
    print("chat build");
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
        padding: EdgeInsets.all(16).copyWith(bottom: 0),
        child: Column(
          children: [
            TextField(
              onChanged: (value){
                setState(() { });
              },
              controller: chatController.msgController.value,
              decoration: InputDecoration(hintText: "Type..."),
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
                  Icons.send,
                  color: Theme.of(context).primaryColor,
                ),
              )
            ]
          : [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.attach_file,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.mic,
                ),
              ),
            ],
    );
  }
}
