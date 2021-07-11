import 'package:chat_app/constants/me.dart';
import 'package:chat_app/dummy/dummy_users.dart';
import 'package:chat_app/models/chat_in_list.dart';
import 'package:chat_app/models/chat_user.dart';
import 'package:chat_app/widgets/chat_exerpt_widget.dart';
import 'package:flutter/material.dart';

class ChatListWidget extends StatelessWidget {
  ChatListWidget({Key? key}) : super(key: key);

  List<ChatInList> chatList = [];
  //List<ChatInList> chatList = [
  //ChatInList(
  //id: "1",
  //lastMessage: "Hello man",
  //members: [
  //ChatUser(
  //id: myId,
  //username: myUsername,
  //avatarUrl: myAvatar,
  //),
  //dummyUsers[0],
  //],
  //name: "First chat",
  //unreedCount: 0),
  //ChatInList(
  //id: "2",
  //lastMessage: "Hello...",
  //members: [
  //ChatUser(
  //id: myId,
  //username: myUsername,
  //avatarUrl: myAvatar,
  //),
  //dummyUsers[1],
  //],
  //name: "Second chat",
  //unreedCount: 0),
  //ChatInList(
  //id: "3",
  //lastMessage: "Hello...",
  //members: [
  //ChatUser(
  //id: myId,
  //username: myUsername,
  //avatarUrl: myAvatar,
  //),
  //dummyUsers[2],
  //],
  //name: "Second chat",
  //unreedCount: 2)
  //];

  @override
  Widget build(BuildContext context) {
    return chatList.length == 0
        ? Text("Chat is empty")
        : ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              ChatInList item = chatList[index];
              return chatExcerptWidget(item: item);
            },
            itemCount: chatList.length,
          );
  }
}
