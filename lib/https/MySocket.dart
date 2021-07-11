import 'dart:async';

import 'package:chat_app/constants/socket_event.dart';
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
      'http://10.0.2.2:3000',
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

  void setupEvents(){
  }

  // events
  void signIn(User item){
    MySocket.getIntace()
        .socket
        .emit(SocketEventNames.signIn, item.toJson());
  }

  void signOut(User item){
    MySocket.getIntace()
        .socket
        .emit(SocketEventNames.signOut, item.toJson());
  }
}
