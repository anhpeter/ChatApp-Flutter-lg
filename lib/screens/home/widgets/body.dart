import 'package:chat_app/widgets/chat_list_widget.dart';
import 'package:flutter/material.dart';
class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(child: ChatListWidget()),
        ],
      ),
    );
  }
}