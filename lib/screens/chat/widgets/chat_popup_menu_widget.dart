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
              leading: Icon(Icons.phone),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              title: Text("Video call"),
              leading: Icon(Icons.videocam),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              title: Text("Search"),
              leading: Icon(Icons.search),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              title: Text("Clear history"),
              leading: Icon(Icons.cleaning_services_rounded),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              title: Text("Clear history"),
              leading: Icon(Icons.delete),
            ),
          ),
        ];
      },
    );
  }
}
