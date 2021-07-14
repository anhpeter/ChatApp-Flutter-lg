import 'package:chat_app/screens/chat/widgets/chat_bar_widget.dart';
import 'package:chat_app/screens/chat/widgets/message_list_widget.dart';
import 'package:chat_app/screens/chat/widgets/scroll_to_bottom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Column(
        children: [
          // message list
          Expanded(
            child: Stack(
              children: [
                MessageListWidget(),
                ScrollToBottomWidget(),
              ],
            ),
          ),

          // chat bar
          ChatBarWidget(),
        ],
      ),
    );
  }
}