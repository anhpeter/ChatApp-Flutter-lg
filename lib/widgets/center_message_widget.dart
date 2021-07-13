import 'package:flutter/material.dart';

class CenterMessgaeWidget extends StatelessWidget {
  final String text;
  const CenterMessgaeWidget({required this.text, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
