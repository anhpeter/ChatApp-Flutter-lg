import 'package:chat_app/constants/my_icon.dart';
import 'package:chat_app/controllers/chat_controller.dart';
import 'package:chat_app/screens/chat/widgets/chat_text_field_widget.dart';
import 'package:chat_app/screens/chat/widgets/typing_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatBarWidget extends StatelessWidget {
  final ChatController chatController = Get.find();

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
        color: Colors.transparent,
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            TypinglistWidget(),
            ChatTextFieldWidget(),
          ],
        ),
      ),
    );
  }

  buildChatActionBar(context) {
    return Obx(() {
      return ButtonBar(
        buttonPadding: EdgeInsets.all(0),
        children: chatController.msgText.value.trim() != ""
            ? [
                IconButton(
                  onPressed: () {
                    chatController.onSendMessgaeHandler();
                  },
                  icon: Icon(
                    SEND_ICON,
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
    });
  }
}
