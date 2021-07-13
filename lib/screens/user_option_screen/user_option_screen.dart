import 'package:chat_app/constants/controllers.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/widgets/all_user_list_widget.dart';
import 'package:flutter/material.dart';

class UserOptionScreen extends StatelessWidget {
  static const String routeNamed = 'user-option';
  const UserOptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Option"),
      ),
      body: AllUserListWidget(
        callback: (User item) {
          authController.signInWithUser(item);
        },
      ),
    );
  }
}
