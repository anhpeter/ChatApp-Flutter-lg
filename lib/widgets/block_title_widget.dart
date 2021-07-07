import 'package:flutter/material.dart';

class BlockTitleWidget extends StatelessWidget {
  final String title;
  const BlockTitleWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Text(title),
      alignment: Alignment.centerLeft,
    );
    ;
  }
}
