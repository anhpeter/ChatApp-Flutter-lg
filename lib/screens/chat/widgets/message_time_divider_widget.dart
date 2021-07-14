import 'package:chat_app/common/Helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageTimeDividerWidget extends StatelessWidget {
  final DateTime time;
  const MessageTimeDividerWidget({required this.time, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        Helper.toDividerTimeFormat(time),
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
