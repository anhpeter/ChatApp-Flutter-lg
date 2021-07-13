import 'package:chat_app/controllers/chat_controller.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class ScrollToBottomWidget extends GetWidget<ChatController> {
  const ScrollToBottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Positioned(
        bottom: 5,
        right: 5,
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 200),
          switchInCurve: Curves.ease,
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(child: child, scale: animation);
          },
          child: !controller.isAtBottom.value
              ? Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: IconButton(
                    onPressed: () {
                      controller.scrollToBottom();
                    },
                    icon: Icon(Icons.south_rounded),
                  ),
                )
              : SizedBox.shrink(),
        ),
      ),
    );
  }
}
