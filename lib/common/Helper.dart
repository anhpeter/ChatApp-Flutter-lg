import 'package:flutter/material.dart';

class Helper {
  static void showSnackbar(BuildContext context, String content) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(content)));
  }

  static toDateTime(value) {
    return value != null ? DateTime.fromMillisecondsSinceEpoch(value) : null;
  }
}
