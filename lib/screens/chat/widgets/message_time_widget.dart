import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageTimeWidget extends StatelessWidget {
  final DateTime time;
  final bool isMe;
  final Color? textColor;
  const MessageTimeWidget(
      {required this.isMe, required this.time, this.textColor, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = textColor ??
        (isMe
            ? Theme.of(context).primaryTextTheme.subtitle1!.color!
            : Colors.black);
    final f = new DateFormat("hh:mm'");
    final timeDisplay = f.format(time);
    return Text(
      timeDisplay,
      style: TextStyle(
        fontSize: 10,
        color: color,
      ),
      textAlign: TextAlign.right,
    );
  }
}
