import 'dart:convert';

import 'package:chat_app/constants/config.dart';
import 'package:chat_app/models/chat.dart';
import 'package:chat_app/models/user.dart';
import 'package:http/http.dart' as http;

class MyHttp {
  static Future<Chat> fetchChatByMemberIds(List<String> memberIds) async {
    Chat chat;
    var response = await http.post(
        Uri.parse(
            '$BACKEND_DOMAIN/chat/getChatInfoByUserIdsOrCreateIfNotExist'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'ids': memberIds,
        }));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      chat = Chat.fromJson(json['payload']);
    } else {
      throw Exception('Failed to load album');
    }
    return chat;
  }

  static Future<List<User>> fetchAllUser() async {
    List<User> list = [];
    var response = await http.get(Uri.parse('$BACKEND_DOMAIN/user/all'));
    if (response.statusCode == 200) {
      var jsonArr = jsonDecode(response.body);
      jsonArr.forEach((itemJsonObj) {
        list.add(User.fromJson(itemJsonObj));
      });
    } else {
      throw Exception('Failed to load album');
    }
    return list;
  }
}
