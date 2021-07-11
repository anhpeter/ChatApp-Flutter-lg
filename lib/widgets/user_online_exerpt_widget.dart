import 'package:chat_app/models/user.dart';
import 'package:chat_app/screens/chat/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_circle_avatar_widget.dart';

class UserOnlineExcerptWidget extends StatelessWidget {
  final User user;

  UserOnlineExcerptWidget({required this.user, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: MyCircleAvatarWidget(imageUrl: user.avatarUrl),
      title: Text(user.username),
      trailing: Icon(
        Icons.circle,
        color: Colors.green,
        size: 12,
      ),
      onTap: () {
        Get.toNamed(ChatScreen.routeNamed, arguments: {
          'type': 'user',
          'id': user.id,
        });
      },
    );
  }
}
