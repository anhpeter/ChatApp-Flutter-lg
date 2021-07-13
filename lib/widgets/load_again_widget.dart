import 'package:flutter/material.dart';

class LoadAgainWidget extends StatelessWidget {
  final String text;
  final VoidCallback? callback;
  LoadAgainWidget({this.callback, this.text = "Load again", Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Something went wrong'),
        ElevatedButton(onPressed: callback, child: Text(text)),
      ],
    );
  }
}
