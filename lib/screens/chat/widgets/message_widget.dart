import 'package:chat_app/models/message.dart';
import 'package:chat_app/screens/chat/widgets/message_wrapper_widget.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  final bool isMe;
  final Message message;
  MessageWidget({required this.isMe, required this.message, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          child: MessageWrapperWidget(
            isMe: isMe,
            child: Text(
              message.text,
              style: TextStyle(color: isMe ? Theme.of(context).primaryTextTheme.subtitle1!.color : Colors.black),
            ),
          ),
        )
      ],
    );
  }
}
