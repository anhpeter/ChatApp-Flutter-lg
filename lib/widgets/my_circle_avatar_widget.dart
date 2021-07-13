import 'package:flutter/material.dart';

class MyCircleAvatarWidget extends StatelessWidget {
  final String? imageUrl;
  final String? username;
  MyCircleAvatarWidget({this.imageUrl, this.username, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? CircleAvatar(
            backgroundImage: NetworkImage(imageUrl!),
          )
        : () {
            String? titleText = username;
            titleText = titleText != null
                ? (titleText.length > 2
                    ? titleText.substring(0, 2).toUpperCase()
                    : "")
                : "";
            return CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: Text(
                titleText,
                style: TextStyle(color: Colors.white),
              ),
            );
          }();
  }
}
