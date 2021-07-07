import 'package:chat_app/common/Helper.dart';
import 'package:chat_app/constants/me.dart';
import 'package:chat_app/screens/setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class _DrawerItemModel {
  final IconData icon;
  final String title;
  final String routeNamed;
  final VoidCallback? onPressHandler;
  const _DrawerItemModel(
      {required this.title,
      required this.icon,
      required this.routeNamed,
      this.onPressHandler});
}

class MainDrawerWidget extends StatelessWidget {
  String avatarUrl = myAvatar;

  List<_DrawerItemModel> drawerItemList = [
    _DrawerItemModel(
        title: "New Group",
        icon: Icons.people,
        routeNamed: "/new-group",
        onPressHandler: () {}),
    _DrawerItemModel(
        title: "Setting",
        icon: Icons.settings,
        routeNamed: "/settings",
        onPressHandler: () {
          Get.back();
          Get.toNamed(SettingScreen.routeNamed);
        }),
  ];
  MainDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          buildDrawerHeader(context),
          ...buildDrawerBody(context),
        ],
      ),
    );
  }

  buildDrawerHeader(context) {
    return Container(
      height: 150,
      child: DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(avatarUrl),
            ),
            IconButton(
                onPressed: () =>
                    Helper.showSnackbar(context, "Change theme..."),
                icon: Icon(Icons.light_mode))
          ],
        ),
      ),
    );
  }

  List<Widget> buildDrawerBody(context) {
    return drawerItemList.map((_DrawerItemModel item) {
      return ListTile(
        title: Text(item.title),
        leading: Icon(item.icon),
        onTap: () {
          item.onPressHandler!();
        },
      );
    }).toList();
  }
}
