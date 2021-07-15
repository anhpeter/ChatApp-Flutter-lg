import 'package:flutter/material.dart';
class AuthTitle extends StatelessWidget {
  final String text;
  const AuthTitle({
    Key? key, required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.headline4!);
  }
}