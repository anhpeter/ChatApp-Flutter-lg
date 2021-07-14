import 'package:chat_app/constants/controllers.dart';
import 'package:chat_app/constants/me.dart';
import 'package:chat_app/controllers/chat_controller.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/screens/chat/widgets/message_time_divider_widget.dart';
import 'package:chat_app/screens/chat/widgets/message_widget.dart';
import 'package:chat_app/widgets/center_message_widget.dart';
import 'package:chat_app/widgets/error_message_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MessageListWidget extends StatelessWidget {
  final ChatController chatController = Get.find();
  MessageListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return chatController.isLoading.value == true
          ? Center(child: CircularProgressIndicator())
          : chatController.error == null
              ? buildMessageList(context)
              : ErrorMessageWidget();
    });
  }

  buildMessageList(context) {
    int length = chatController.chat.value!.messages.length;
    return chatController.chat.value!.messages.length == 0
        ? const CenterMessgaeWidget(text: "Say hi :)")
        : ListView.builder(
            reverse: true,
            controller: chatController.scrollController,
            itemCount: length,
            itemBuilder: (_, index) {
              int index$ = (index + 1 - length).abs();
              Message item = chatController.chat.value!.messages[index$];
              Message? previousItem = index$ > 0
                  ? chatController.chat.value!.messages[index$ - 1]
                  : null;
              bool isShowDate = previousItem != null
                  ? previousItem.timestamp
                          .isBefore(item.timestamp.subtract(Duration(days: 1)))
                      ? true
                      : item.timestamp.day != previousItem.timestamp.day
                  : true;
              return Column(
                  children: [
                    isShowDate
                        ? MessageTimeDividerWidget(time: item.timestamp)
                        : SizedBox.shrink(),
                    MessageWidget(
                      isMe: item.sender.id == authController.user.value!.id,
                      message: item,
                    )
                  ],
                );
            },
          );
  }
}
