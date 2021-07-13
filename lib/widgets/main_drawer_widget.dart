import 'package:chat_app/common/Helper.dart';
import 'package:chat_app/constants/controllers.dart';
import 'package:chat_app/constants/me.dart';
import 'package:chat_app/constants/my_icon.dart';
import 'package:chat_app/controllers/app_controller.dart';
import 'package:chat_app/screens/setting/setting_screen.dart';
import 'package:chat_app/widgets/my_circle_avatar_widget.dart';
import 'package:chat_app/widgets/online_user_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainDrawerWidget extends StatelessWidget {
  String avatarUrl = myAvatar;
  AppController appController = Get.find();

  var drawerItemList = [
    {
      'title': "New Group",
      'icon': GROUP_ICON,
      'routeNamed': "/new-group",
    },
    {
      'title': "Setting",
      'icon': SETTING_ICON,
      'routeNamed': SettingScreen.routeNamed,
    },
    {
      'title': "Sign out",
      'icon': SIGN_OUT_ICON,
      'onPressHandler': () {
        authController.signOut();
      },
    },
  ];
  MainDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => authController.isLogged
          ? Drawer(
              child: Column(
                // Important: Remove any padding from the ListView.
                children: <Widget>[
                  buildDrawerHeader(context),
                  ...buildDrawerBody(context),
                  Divider(),
                  SizedBox(height: 2),
                  Expanded(
                    child: OnlineUserListWidget(),
                  ),
                ],
              ),
            )
          : SizedBox.shrink(),
    );
  }

  buildDrawerHeader(context) {
    return Container(
      height: 150,
      child: DrawerHeader(
        decoration: BoxDecoration(),
        child: Obx(() => authController.isLogged
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyCircleAvatarWidget(
                      imageUrl: authController.user.value!.avatarUrl),
                  IconButton(
                    onPressed: () => appController.toggleTheme(),
                    icon: Icon(appController.themeMode.value == ThemeMode.light
                        ? DARK_MODE_ICON
                        : LIGHT_MODE_ICON),
                  )
                ],
              )
            : Container()),
      ),
    );
  }

  List<Widget> buildDrawerBody(context) {
    return drawerItemList.map((item) {
      return ListTile(
        title: Text(item['title'] as String),
        leading: Icon(item['icon'] as IconData),
        onTap: () {
          if (item['onPressHandler'] == null) {
            Get.toNamed(item['routeNamed'] as String);
          } else {
            (item['onPressHandler'] as VoidCallback)();
          }
        },
      );
    }).toList();
  }
}
