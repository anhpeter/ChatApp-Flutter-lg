import 'package:chat_app/common/Helper.dart';
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
        (isMe ? Theme.of(context).primaryColorLight : Colors.black54);

    DateFormat f = DateFormat('hh:mm');
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "${f.format(time)}'",
          style: Theme.of(context).textTheme.caption!.copyWith(color: color),
          textAlign: TextAlign.right,
        ),
      ],
    );
  }
}
