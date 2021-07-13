import 'package:chat_app/controllers/chat_controller.dart';
import 'package:chat_app/widgets/my_circle_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypinglistWidget extends StatelessWidget {
  TypinglistWidget({Key? key}) : super(key: key);
  final ChatController _chatController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Column(
          children: _chatController.typingUserList.map((item) {
            return ListTile(
              tileColor: Colors.transparent,
              leading: MyCircleAvatarWidget(
                imageUrl: item.avatarUrl,
              ),
              title: Image.asset(
                'assets/gif/typing.gif',
                width: 30,
                height: 30,
                fit: BoxFit.contain,
                alignment: Alignment.centerLeft,
              ),
              contentPadding: EdgeInsets.all(0),
            );
          }).toList(),
        ),
      ),
    );
  }
}
