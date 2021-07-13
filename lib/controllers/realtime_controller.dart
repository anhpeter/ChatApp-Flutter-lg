import 'dart:collection';

import 'package:chat_app/constants/controllers.dart';
import 'package:chat_app/constants/socket_event_names.dart';
import 'package:chat_app/https/MySocket.dart';
import 'package:chat_app/models/user.dart';
import 'package:get/get.dart';

class RealtimeController extends GetxController {
  RxList<User> onlineUserList = <User>[].obs;
  MySocket mySocket = MySocket.getIntace();

  @override
  void onInit() {
    setupSocketEvents();
    super.onInit();
  }

  void setupSocketEvents() {
    mySocket.socket.on(SocketEventNames.onlineUser, socketUserOnline);
  }

  void socketUserOnline(data) {
    if (authController.user.value != null) {
      var list = data.map<User>((item) {
        return User.fromJson(item);
      });
      onlineUserList.value = list.toList();
    }
  }

  @override
  void onClose() {
    mySocket.socket.off(SocketEventNames.onlineUser, socketUserOnline);
    super.onClose();
  }
}
