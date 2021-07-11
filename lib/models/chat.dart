import 'package:chat_app/models/chat_user.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/models/user.dart';

class Chat {
  static const ID = 'id';
  static const NAME = 'name';
  static const MEMBERS = 'members';
  static const MESSAGES = 'messages';

  String id;
  String name;
  List<User> members;
  List<Message> messages;

  Chat({
    required this.id,
    required this.name,
    required this.members,
    required this.messages,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    List<User> members = [];
    if (json[MEMBERS] != null) {
      json[MEMBERS].forEach((item) {
        members.add(User.fromJson(item));
      });
    }

    List<Message> messages = [];
    if (json[MESSAGES] != null) {
      json[MESSAGES].forEach((item) {
        messages.add(Message.fromJson(item));
      });
    }
    return Chat(
      id: json['_id'],
      name: json['name'],
      members: members,
      messages: messages,
    );
  }
}
