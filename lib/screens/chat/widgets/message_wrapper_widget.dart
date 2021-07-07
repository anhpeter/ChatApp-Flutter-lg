import 'package:flutter/material.dart';

class MessageWrapperWidget extends StatelessWidget {
  final bool isMe;
  final Widget child;
  MessageWrapperWidget({required this.isMe, required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isMe ? Theme.of(context).primaryColor : Colors.grey[350],
        borderRadius: isMe
            ? BorderRadius.circular(16)
                .copyWith(bottomRight: Radius.circular(0))
            : BorderRadius.circular(16)
                .copyWith(bottomLeft: Radius.circular(0)),
      ),
      child: child,
    );
  }
}
