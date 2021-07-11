import 'package:chat_app/constants/me.dart';
import 'package:chat_app/models/chat_in_list.dart';
import 'package:chat_app/models/chat_user.dart';
import 'package:chat_app/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class chatExcerptWidget extends StatelessWidget {
  ChatInList item;
  chatExcerptWidget({required this.item, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatUser friend = item.members.singleWhere((item) => item.id != myId);
    return ListTile(
      title: Text(item.name),
      trailing: item.unreedCount > 0
          ? Chip(
              label: Text(item.unreedCount.toString(),
                  style: TextStyle(color: Colors.white)),
              backgroundColor: Colors.grey,
            )
          : Icon(Icons.check, color: Theme.of(context).textTheme.subtitle1!.color),
      subtitle: Text(
        item.lastMessage,
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(friend.avatarUrl),
      ),
      onTap: () {
        Get.toNamed(ChatScreen.routeNamed, arguments: {
          'type': 'chat',
          'id': item.id,
        });
      },
    );
  }
}
