import 'package:flutter/material.dart';

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
              leading: Icon(Icons.edit),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              title: Text("Set new photo"),
              leading: Icon(Icons.add_a_photo),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              title: Text("Sign out"),
              leading: Icon(Icons.logout),
            ),
          ),
        ];
      },
    );
  }
}
