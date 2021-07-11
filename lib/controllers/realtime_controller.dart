import 'package:chat_app/constants/socket_event.dart';
import 'package:chat_app/https/MySocket.dart';
import 'package:chat_app/models/user.dart';
import 'package:get/get.dart';

class RealtimeController extends GetxController {
  RxList<User> onlineUserList = <User>[].obs;
  MySocket mySocket = MySocket.getIntace();

  @override
  void onReady() {
    setupEvents();
    super.onReady();
  }

  void setupEvents() {
    handleUserOnline();
  }

  void handleUserOnline() {
    mySocket.socket.on(SocketEventNames.onlineUser, (data) {
      var list = data.map<User>((item) {
        return User.fromJson(item);
      });
      onlineUserList.value = list.toList();
    });
  }
}
