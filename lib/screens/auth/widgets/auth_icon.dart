import 'package:flutter/material.dart';

class AuthBrandIcon extends StatelessWidget {
  final String iconPath;
  final VoidCallback? callback;
  const AuthBrandIcon({
    Key? key,
    required this.iconPath,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: callback,
      iconSize: 50,
      icon: Image.asset(iconPath),
    );
  }
}
