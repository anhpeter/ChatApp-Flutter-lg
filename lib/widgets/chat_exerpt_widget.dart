import 'package:chat_app/constants/controllers.dart';
import 'package:chat_app/constants/me.dart';
import 'package:chat_app/models/chat_in_list.dart';
import 'package:chat_app/models/chat_user.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/screens/chat/chat_screen.dart';
import 'package:chat_app/screens/chat/widgets/message_time_widget.dart';
import 'package:chat_app/widgets/ellipsis_text_widget.dart';
import 'package:chat_app/widgets/my_circle_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatExcerptWidget extends StatelessWidget {
  final ChatInList item;
  ChatExcerptWidget({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User friend = item.members
        .firstWhere((item) => item.id != authController.user.value!.id);
    String lastMessagePrefix =
        item.lastMessage.sender.id == authController.user.value!.id
            ? "Me: "
            : item.lastMessage.sender.username + ": ";
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: EllipsisTextWidget(friend.username)),
          MessageTimeWidget(
            isMe: authController.user.value!.id == item.lastMessage.sender.id,
            textColor: Theme.of(context).textTheme.bodyText2!.color,
            time: item.lastMessage.timestamp,
          )
        ],
      ),
      trailing: item.unreedCount != null
          ? item.unreedCount! > 0
              ? Chip(
                  label: Text(item.unreedCount.toString(),
                      style: TextStyle(color: Colors.white)),
                  backgroundColor: Colors.grey,
                )
              : Icon(Icons.check,
                  color: Theme.of(context).textTheme.subtitle1!.color)
          : null,
      subtitle:
          EllipsisTextWidget("$lastMessagePrefix${item.lastMessage.text}"),
      leading: MyCircleAvatarWidget(imageUrl: friend.avatarUrl, username: friend.username,),
      onTap: () {
        Get.toNamed(ChatScreen.routeNamed, arguments: {
          'type': 'user',
          'id': friend.id,
        });
      },
    );
  }
}
