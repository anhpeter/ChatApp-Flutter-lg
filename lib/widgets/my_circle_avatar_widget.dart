import 'package:flutter/material.dart';

class MyCircleAvatarWidget extends StatelessWidget {
  final String imageUrl;
  MyCircleAvatarWidget({required this.imageUrl, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: NetworkImage(imageUrl),
    );
  }
}
