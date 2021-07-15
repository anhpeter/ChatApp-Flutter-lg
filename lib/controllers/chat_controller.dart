import 'dart:async';

import 'package:chat_app/common/SocketHelper.dart';
import 'package:chat_app/constants/controllers.dart';
import 'package:chat_app/constants/socket_event_names.dart';
import 'package:chat_app/controllers/chat_list_controller.dart';
import 'package:chat_app/https/MyHttp.dart';
import 'package:chat_app/https/MySocket.dart';
import 'package:chat_app/models/chat.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  var scrollController = ScrollController();
  var msgController = TextEditingController();
  ChatListController _chatListController = Get.find();
  Timer? typingTimer;
  List<Message> newMessageList = [];
  bool isTypingFlag = false;

  // obs
  Rx<Chat?> chat = (null as Chat).obs;
  Rx<String> msgText = "".obs;
  RxList<User> typingUserList = <User>[].obs;
  Rx<String>? error;
  Rx<bool> isLoading = true.obs;
  Rx<bool> isAtBottom = true.obs;

  MySocket mySocket = MySocket.getIntace();

  @override
  void onInit() {
    setupSocketEvents();
    handleTextMsgChange();
    scrollListHandler();
    super.onInit();
  }

  void handleTextMsgChange() {
    msgController.addListener(() {
      msgText.value = msgController.value.text;
      handleSocketTyping();
    });
  }

  void scrollListHandler() {
    scrollController.addListener(() {
      isAtBottom.value = (scrollController.position.pixels == 0);
    });

    isAtBottom.listen((value) {
      // if reach bottom
      if (value) {
        // append new message to the bottom of list
        if (newMessageList.length > 0) {
          addMultiMessage(newMessageList);
          newMessageList.clear();
        }
      }
    });
  }

  // fetch
  void fetchChat({type, value}) async {
    isLoading.value = true;
    try {
      switch (type) {
        case 'by-member-ids':
          chat = Rx<Chat>(await MyHttp.fetchChatByMemberIds(value));
          break;
        case 'by-id':
          chat = Rx<Chat>(await MyHttp.fetchChatById(value));
          break;
      }
      emitJoinRoom();
    } catch (err) {
      print(err.toString());
      error = Rx<String>(err.toString());
    }
    isLoading.value = false;
  }

  // socket
  void setupSocketEvents() {
    mySocket.socket.on(SocketEventNames.typing, typingSocketListener);
    mySocket.socket.on(SocketEventNames.stopTyping, stopTypingSocketListener);
    mySocket.socket
        .on(SocketEventNames.receiveMessage, receiveMessageSocketListener);
  }

  void handleSocketTyping() {
    void emitStopTypingTimer() {
      typingTimer = Timer(Duration(milliseconds: 2000), () {
        emitStopTyping();
      });
    }

    if (msgText.trim().length >= 3 && !isTypingFlag) {
      emitTyping();
      emitStopTypingTimer();
      isTypingFlag = true;
    } else if (isTypingFlag) {
      typingTimer!.cancel();
      emitStopTypingTimer();
    }
  }

  // socket emitters
  void emitJoinRoom() {
    mySocket.socket.emit(SocketEventNames.joinRoom,
        {'roomName': "${SocketHelper.getCurrentChatIdFormat(chat.value!.id)}"});
  }

  void emitLeaveRoom() {
    if (chat.value != null)
      mySocket.socket.emit(SocketEventNames.leaveRoom, {
        'roomName': "${SocketHelper.getCurrentChatIdFormat(chat.value!.id)}"
      });
  }

  void emitSendMessage() {
    mySocket.socket.emit(SocketEventNames.sendMessage, {
      'user': authController.user.value,
      'message': msgText.value,
      'chatId': chat.value!.id
    });
  }

  void emitTyping() {
    mySocket.socket.emit(SocketEventNames.typing, {
      'user': authController.user.value!.toJson(),
      'chatId': chat.value!.id
    });
  }

  void emitStopTyping() {
    if (isTypingFlag) {
      if (typingTimer!.isActive) typingTimer!.cancel();
      isTypingFlag = false;
    }
    mySocket.socket.emit(SocketEventNames.stopTyping, {
      'user': authController.user.value!.toJson(),
      'chatId': chat.value!.id
    });
  }

  // socket listeners
  void receiveMessageSocketListener(data) {
    var message = Message.fromJson(data['message']);
    if (isAtBottom.value)
      addMessage(message);
    else {
      // not at bottom
      Get.snackbar(message.sender.username, message.text, onTap: (_) {
        if (data['chatId'] == chat.value!.id) {
          scrollToBottom();
        }
      });
      newMessageList.add(message);
    }
  }

  void typingSocketListener(data) {
    User user = User.fromJson(data['user']);
    typingUserList.add(user);
  }

  void stopTypingSocketListener(data) {
    User user = User.fromJson(data['user']);
    typingUserList.removeWhere((item) => item.id == user.id);
  }

  //
  void addMessage(Message item) {
    chat.value!.messages.add(item);
    chat.refresh();
  }

  void addMultiMessage(List<Message> items) {
    chat.value!.messages.addAll(items);
    chat.refresh();
  }

  void onSendMessgaeHandler() {
    var message = Message(
      text: msgText.value,
      messageType: "text",
      sender: authController.user.value!,
      timestamp: new DateTime.now(),
    );

    emitSendMessage();
    addMessage(message);
    _chatListController.handleReceiveNewMessage(message, chat.value!.id);
    emitStopTyping();
    clearTextMsg();
  }

  void clearTextMsg() {
    msgController.clear();
  }

  //
  void scrollToBottom({VoidCallback? callback}) {
    int ms = 1000;
    scrollController.animateTo(
      scrollController.position.minScrollExtent,
      duration: Duration(milliseconds: ms),
      curve: Curves.fastOutSlowIn,
    );
    if (callback != null)
      Future.delayed(Duration(milliseconds: ms), () {
        callback();
      });
  }

  @override
  void onClose() {
    emitLeaveRoom();
    mySocket.socket.off(SocketEventNames.typing, typingSocketListener);
    mySocket.socket.off(SocketEventNames.stopTyping, stopTypingSocketListener);
    mySocket.socket
        .off(SocketEventNames.receiveMessage, receiveMessageSocketListener);
    super.onClose();
  }
}
