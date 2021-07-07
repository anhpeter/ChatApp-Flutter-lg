import 'package:chat_app/models/chat_user.dart';
import 'package:chat_app/models/message.dart';

class ChatInList {
  String id;
  String name;
  List<ChatUser> members;
  String lastMessage;
  int unreedCount;
  ChatInList({
    required this.id,
    required this.name,
    required this.members,
    required this.lastMessage,
    required this.unreedCount,
  });
}
