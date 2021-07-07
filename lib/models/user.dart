import 'package:chat_app/models/change_time.dart';

class User {
  String id;
  String username;
  String fullname;
  String avatarUrl;
  String email;
  String phone;
  String password;
  ChangeTime created;
  ChangeTime modified;
  DateTime lastActive;

  User({
    required this.id,
    required this.username,
    required this.fullname,
    required this.email,
    required this.phone,
    required this.password,
    required this.avatarUrl,
    required this.created,
    required this.modified,
    required this.lastActive,
  });

  User.fromJson(){
    this.lastActive = DateTime.now();

  }
}
