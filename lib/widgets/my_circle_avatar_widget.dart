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
            child: ClipOval(
              child: Image.network(
                imageUrl!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ____) {
                  return buildUsernameText(username!);
                },
                //backgroundImage: NetworkImage(imageUrl!),
              ),
            ),
          )
        : buildUsernameAvatar(context);
  }

  buildUsernameAvatar(context) {
    return CircleAvatar(
      backgroundColor: Theme.of(context).primaryColor,
      child: buildUsernameText(username ?? ""),
    );
  }

  Widget buildUsernameText(String username) {
    String text =
        username.length > 2 ? username.substring(0, 2).toUpperCase() : "";
    return Text(
      text,
      style: TextStyle(color: Colors.white),
    );
  }
}
