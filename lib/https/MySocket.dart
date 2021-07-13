import 'dart:async';

import 'package:chat_app/constants/config.dart';
import 'package:chat_app/constants/socket_event_names.dart';
import 'package:chat_app/models/user.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MySocket {
  static MySocket? _intance;

  late IO.Socket socket;
  late String socketId;

  MySocket._() {
    connectSocketIo();
  }

  static MySocket getIntace() {
    return _intance ??= MySocket._();
  }

  void connectSocketIo() {
    socket = IO.io(
      BACKEND_DOMAIN,
      <String, dynamic>{
        'transports': ['websocket'],
      },
    );

    socket.onConnect((data) {
      socketId = socket.id;
      print('socket connected $socketId');
    });
    socket.connect();

    setupEvents();
  }

  void setupEvents() {}

  // events
  void signIn(User item) {
    MySocket.getIntace().socket.emit(SocketEventNames.signIn, item.toJson());
  }

  void signOut(User item) {
    MySocket.getIntace()
        .socket
        .emit(SocketEventNames.signOut, {'user': item.toJson()});
  }
}
