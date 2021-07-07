import 'package:chat_app/common/Helper.dart';
import 'package:chat_app/screens/setting/widgets/setting_popup_menu_widget.dart';
import 'package:chat_app/widgets/main_drawer_widget.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  static const String routeNamed = "/setting";
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Setting"),
        actions: [
          SettingPopupMenuWidget(),
        ],
      ),
      body: Center(
        child: Text("This is setting screen"),
      ),
    );
  }
}
