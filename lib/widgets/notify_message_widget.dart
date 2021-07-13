import 'package:flutter/material.dart';

class NotifyMessageWidget extends StatelessWidget {
  final String text;
  const NotifyMessageWidget({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
