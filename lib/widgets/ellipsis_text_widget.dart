import 'package:flutter/material.dart';

class EllipsisTextWidget extends StatelessWidget {
  final String text;

  const EllipsisTextWidget(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
