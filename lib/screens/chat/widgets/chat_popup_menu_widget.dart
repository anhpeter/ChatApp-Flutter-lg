import 'package:chat_app/constants/my_icon.dart';
import 'package:chat_app/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPopupMenuWidget extends StatelessWidget {
  ChatPopupMenuWidget({Key? key}) : super(key: key);
  final ChatController _chatController = Get.find();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: ListTile(
              title: Text("Call"),
              leading: Icon(PHONE_ICON),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              title: Text("Video call"),
              leading: Icon(VIDEO_CAM_ICON),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              title: Text("Search"),
              leading: Icon(SEARCH_ICON),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              title: Text("Clear history"),
              leading: Icon(CLEAN_ICON),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              title: Text("Clear history"),
              leading: Icon(DELETE_ICON),
            ),
          ),
        ];
      },
    );
  }
}
