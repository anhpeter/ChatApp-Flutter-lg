import 'package:flutter/material.dart';

class MyCircularProgressWidget extends StatelessWidget {
  const MyCircularProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
