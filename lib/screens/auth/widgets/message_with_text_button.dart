import 'package:flutter/material.dart';
class MessageWithTextButton extends StatelessWidget {
  final String message;
  final String buttonText;
  final VoidCallback? buttonCallback;
  const MessageWithTextButton({
    Key? key,
    required this.message,
    required this.buttonText,
    this.buttonCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(message),
        TextButton(
            onPressed: buttonCallback,
            child: Text(buttonText)),
      ],
    );
  }
}