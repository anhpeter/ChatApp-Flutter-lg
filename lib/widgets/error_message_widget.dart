import 'package:chat_app/widgets/notify_message_widget.dart';
import 'package:flutter/material.dart';
class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NotifyMessageWidget(text: "Something went wrong!");
  }
}