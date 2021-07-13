import 'dart:convert';

import 'package:chat_app/models/chat_user.dart';
import 'package:chat_app/models/message.dart';
import 'package:chat_app/models/user.dart';

class ChatInList {
  static const ID = '_id';
  static const NAME = 'name';
  static const MEMBERS = 'members';
  static const LASTMESSAGE = 'last_message';
  static const UNREEDCOUNT = 'unreadcount';

  String id;
  String? name;
  List<User> members;
  Message lastMessage;
  int? unreedCount;

  ChatInList({
    required this.id,
    required this.members,
    required this.lastMessage,
    this.name,
    this.unreedCount,
  });

  factory ChatInList.fromJson(Map<String, dynamic> json) {
    List<User> members = [];
    if (json[MEMBERS] != null) {
      json[MEMBERS].forEach((item) {
        members.add(User.fromJson(item));
      });
    }
    return ChatInList(
      id: json[ID],
      name: json[NAME],
      members: members,
      lastMessage: Message.fromJson(json[LASTMESSAGE]),
      unreedCount:
          json[UNREEDCOUNT] != null ? int.parse(json[UNREEDCOUNT]) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      ID: id,
      NAME: name,
      MEMBERS: members.length,
      LASTMESSAGE: lastMessage.timestamp,
      UNREEDCOUNT: unreedCount,
    };
  }
}
