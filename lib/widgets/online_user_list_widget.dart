import 'package:chat_app/constants/controllers.dart';
import 'package:chat_app/controllers/realtime_controller.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/widgets/my_circle_avatar_widget.dart';
import 'package:chat_app/widgets/user_online_exerpt_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnlineUserListWidget extends StatefulWidget {
  const OnlineUserListWidget({Key? key}) : super(key: key);

  @override
  _OnlineUserListWidgetState createState() => _OnlineUserListWidgetState();
}

class _OnlineUserListWidgetState extends State<OnlineUserListWidget> {
  RealtimeController _realtimeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        var onlineList = _realtimeController.onlineUserList
            .where((item) => item.id != authController.user.value!.id)
            .toList();
        return Column(
          children: [
            buildTitle(onlineList.length),
            Expanded(
              child: ListView.builder(
                itemCount: onlineList.length,
                itemBuilder: (context, index) {
                  var item = onlineList[index];
                  return UserOnlineExcerptWidget(user: item);
                },
              ),
            )
          ],
        );
      },
    );
  }

  buildTitle(int userOnlineCount) {
    String content = userOnlineCount > 0 ? "Online user" : "No user online";
    return Text(content);
  }
}
