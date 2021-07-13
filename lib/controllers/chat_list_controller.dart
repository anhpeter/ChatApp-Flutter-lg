import 'package:collection/collection.dart';
import 'package:chat_app/constants/socket_event_names.dart';
import 'package:chat_app/https/MyHttp.dart';
import 'package:chat_app/https/MySocket.dart';
import 'package:chat_app/models/chat_in_list.dart';
import 'package:chat_app/models/message.dart';
import 'package:get/get.dart';

class ChatListController extends GetxController {
  MySocket mySocket = MySocket.getIntace();

// obs
  RxList<ChatInList> chatList = <ChatInList>[].obs;
  Rx<bool> isLoading = true.obs;
  Rx<String>? error;

  @override
  void onReady() {
    setupSocketEvents();
    super.onReady();
  }

  // fetch
  void fetchChatList(String id) {
    isLoading.value = true;
    MyHttp.fetchChatList(id).then((list) {
      chatList.value = list;
    }).catchError((err) {
      error = Rx<String>(err.toString());
    }).then((value) {
      isLoading.value = false;
    });
  }

  // socket
  void setupSocketEvents() {
    mySocket.socket
        .on(SocketEventNames.receiveMessage, receiveMessageSocketListener);
  }

  // socket listeners
  void receiveMessageSocketListener(data) {
    var message = Message.fromJson(data['message']);
    handleReceiveNewMessage(message, data['chatId']);
  }

  void handleReceiveNewMessage(Message message, String chatId) {
    var item = this.chatList.firstWhereOrNull((item) {
      return item.id == chatId;
    });
    if (item != null) {
      updateLastMessage(item, message);
    } else {
      MyHttp.fetchBriefChatById(chatId).then((item) => prependChat(item));
    }
  }

  //
  void prependChat(ChatInList item) {
    chatList.insert(0, item);
  }

  void updateLastMessage(ChatInList chatInList, Message message) {
    chatInList.lastMessage = message;
    sortChatList();
  }

  void sortChatList() {
    chatList.sort((a, b) {
      return a.lastMessage.timestamp.isBefore(b.lastMessage.timestamp) ? 1 : 0;
    });
  }

  //
  @override
  void onClose() {
    mySocket.socket
        .off(SocketEventNames.receiveMessage, receiveMessageSocketListener);
    super.onClose();
  }
}
