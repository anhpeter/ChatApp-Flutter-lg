import 'package:chat_app/https/MyHttp.dart';
import 'package:chat_app/models/user.dart';
import 'package:chat_app/widgets/my_circle_avatar_widget.dart';
import 'package:chat_app/widgets/my_circlular_progress_widget.dart';
import 'package:flutter/material.dart';

class AllUserListWidget extends StatefulWidget {
  final Function(User)? callback;
  const AllUserListWidget({this.callback, Key? key}) : super(key: key);

  @override
  _AllUserListWidgetState createState() => _AllUserListWidgetState();
}

class _AllUserListWidgetState extends State<AllUserListWidget> {
  late Future<List<User>> futureUserList;

  @override
  void initState() {
    futureUserList = MyHttp.fetchAllUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: futureUserList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SingleChildScrollView(
            child: buildUserList(snapshot.data ?? []),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Something went wrong!'));
        }
        return MyCircularProgressWidget();
      },
    );
  }

  buildUserList(List<User> list) {
    return Column(
      children: list.map((User item) {
        return ListTile(
          leading: MyCircleAvatarWidget(
            imageUrl: item.avatarUrl,
          ),
          title: Text(item.username),
          onTap: () {
            if (widget.callback != null) widget.callback!(item);
          },
        );
      }).toList(),
    );
  }
}
