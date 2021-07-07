import 'package:chat_app/constants/my_icon.dart';
import 'package:flutter/material.dart';

class ChatPopupMenuWidget extends StatelessWidget {
  const ChatPopupMenuWidget({Key? key}) : super(key: key);

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
