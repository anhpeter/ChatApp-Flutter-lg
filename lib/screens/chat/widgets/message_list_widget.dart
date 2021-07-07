import 'package:chat_app/constants/me.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/screens/chat/widgets/message_widget.dart';
import 'package:flutter/material.dart';

class MessageListWidget extends StatelessWidget {
  MessageListWidget({Key? key}) : super(key: key);
  var messageList = [
    Message(
      id: "1",
      chatId: "1",
      senderId: "0",
      receiverId: "1",
      text: "Hello",
      messageType: "text",
      timestamp: DateTime.now(),
    ),
    Message(
      id: "2",
      chatId: "1",
      senderId: "1",
      receiverId: "0",
      text: "Hi man",
      messageType: "text",
      timestamp: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: messageList.map((item) {
          return MessageWidget(isMe: item.senderId == myId, message: item);
        }).toList(),
      ),
    );
  }
}
