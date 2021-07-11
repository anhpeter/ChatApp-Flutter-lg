import 'package:chat_app/constants/controllers.dart';
import 'package:chat_app/constants/socket_event.dart';
import 'package:chat_app/https/MyHttp.dart';
import 'package:chat_app/https/MySocket.dart';
import 'package:chat_app/models/chat.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  var scrollController = ScrollController();
  late Rx<Chat> chat;
  Rx<String> msgText = "".obs;
  RxList<User> typingUserList = <User>[].obs;
  var msgController = TextEditingController().obs;

  Rx<String>? error;
  Rx<bool> isLoading = true.obs;

  MySocket mySocket = MySocket.getIntace();

  @override
  void onReady() {
    setupSocketEvents();
    msgController.value.addListener(() {
      msgText.value = msgController.value.text;
    });
    super.onReady();
  }

  void setupSocketEvents() {
    mySocket.socket.on(SocketEventNames.typing, (data) {
      print('typing()');
    });

    mySocket.socket.on(SocketEventNames.receiveMessage, (data) {
      var message = Message.fromJson(data['message']);
      chat.value.messages.add(message);
      chat.refresh();
      scrollToBottom();
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

  void sendMessage() {
    mySocket.socket.emit(SocketEventNames.sendMessage, {
      'user': authController.user.value,
      'message': msgText.value,
      'chatId': chat.value.id
    });
    clear();
  }

  void scrollToBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      scrollController.jumpTo(scrollController.position.minScrollExtent);
    });
  }

  void clear() {
    msgController.value.clear();
  }
}
