import 'package:flutter/material.dart';

class AuthTitle extends StatelessWidget {
  final String text;
  const AuthTitle({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLightMode = Theme.of(context).brightness == Brightness.light;
    return Text(text,
        style: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(color: isLightMode ? Theme.of(context).primaryColor: Colors.white));
  }
}
