import 'package:chat_app/constants/socket_event.dart';
import 'package:chat_app/https/MyHttp.dart';
import 'package:chat_app/https/MySocket.dart';
import 'package:chat_app/models/chat.dart';
import 'package:chat_app/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  late Rx<Chat> chat;
  Rx<String>? error;
  Rx<bool> isLoading = true.obs;
  RxList<User> typingUserList = <User>[].obs;
  var msgController = TextEditingController().obs;
  MySocket mySocket = MySocket.getIntace();

  @override
  void onReady() {
    setupSocketEvents();
    super.onReady();
  }

  void setupSocketEvents() {
    mySocket.socket.on(SocketEventNames.typing, (data) {
      print('typing()');
    });

    mySocket.socket.on(SocketEventNames.receiveMessage, (data) {
      print('receive message()');
    });
  }

  fetchChatByMemberIds(List<String> memberIds) async {
    isLoading.value = true;
    try {
      print(memberIds);
      chat = Rx<Chat>(await MyHttp.fetchChatByMemberIds(memberIds));
    } catch (err) {
      error = Rx<String>(err.toString());
    }
    isLoading.value = false;
  }

  clear() {
    msgController.value.clear();
  }
}
