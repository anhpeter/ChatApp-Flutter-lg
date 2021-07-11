import 'package:chat_app/constants/controllers.dart';
import 'package:chat_app/controllers/auth_controller.dart';
import 'package:chat_app/https/MyHttp.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/widgets/my_circle_avatar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserOptionScreen extends StatefulWidget {
  static const String routeNamed = "/user-option";
  const UserOptionScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _UserOptionScreenState();
  }
}

class _UserOptionScreenState extends State {
  late Future<List<User>> futureUserList;

  @override
  void initState() {
    futureUserList = MyHttp.fetchAllUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Option"),
      ),
      body: Center(
        child: FutureBuilder<List<User>>(
          future: futureUserList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children:
                    buildUserList(snapshot.data ?? []),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text('Something went wrong!'));
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }

  buildUserList(List<User> list) {
    return list.map((User item) {
      return ListTile(
        leading: MyCircleAvatarWidget(
          imageUrl: item.avatarUrl,
        ),
        title: Text(item.username),
        onTap: () {
          authController.signInWithUser(item);
        },
      );
    }).toList();
  }
}
