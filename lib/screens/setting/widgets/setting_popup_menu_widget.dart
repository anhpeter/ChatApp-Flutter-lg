import 'package:chat_app/constants/controllers.dart';
import 'package:chat_app/constants/my_icon.dart';
import 'package:chat_app/constants/socket_event_names.dart';
import 'package:chat_app/https/MySocket.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPopupMenuWidget extends StatelessWidget {
  const SettingPopupMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            child: ListTile(
              title: Text("Edit name"),
              leading: Icon(EDIT_ICON),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              title: Text("Set new photo"),
              leading: Icon(ADD_PHOTO_ICON),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              title: Text("Sign out"),
              leading: Icon(SIGN_OUT_ICON),
              onTap: () => authController.signOut(),
            ),
          ),
        ];
      },
    );
  }
}
