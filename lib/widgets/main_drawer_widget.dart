import 'package:chat_app/common/Helper.dart';
import 'package:chat_app/constants/me.dart';
import 'package:chat_app/constants/my_icon.dart';
import 'package:chat_app/controllers/app_controller.dart';
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
  AppController appController = Get.find();

  List<_DrawerItemModel> drawerItemList = [
    _DrawerItemModel(
        title: "New Group",
        icon: GROUP_ICON,
        routeNamed: "/new-group",
        onPressHandler: () {}),
    _DrawerItemModel(
        title: "Setting",
        icon: SETTING_ICON,
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
        decoration: BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(avatarUrl),
            ),
            IconButton(
              onPressed: () => appController.toggleTheme(),
              icon: Icon(appController.themeMode.value == ThemeMode.light
                  ? DARK_MODE_ICON
                  : LIGHT_MODE_ICON),
            )
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
