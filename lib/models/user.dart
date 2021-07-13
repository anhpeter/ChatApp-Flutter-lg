import 'dart:convert';

import 'package:chat_app/common/Helper.dart';

class User {
  static const ID = '_id';
  static const USERNAME = 'username';
  static const FULLNAME = 'fullname';
  static const AVATARURL = 'avatar_url';
  static const EMAIL = 'email';
  static const PHONE = 'phone';
  static const PASSWORD = 'password';
  static const CREATED = 'created';
  static const MODIFIED = 'modified';
  static const LASTACTIVE = 'last_active';

  String id;
  String username;
  String? fullname;
  String? avatarUrl;
  String? email;
  String? phone;
  String password;
  DateTime? created;
  DateTime? modified;
  DateTime? lastActive;

  User({
    required this.id,
    required this.username,
    required this.password,
    this.avatarUrl,
    this.fullname,
    this.email,
    this.phone,
    this.created,
    this.modified,
    this.lastActive,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json[ID],
      username: json[USERNAME],
      fullname: json[FULLNAME],
      email: json[EMAIL],
      phone: json[PHONE],
      password: json[PASSWORD],
      avatarUrl: json[AVATARURL],
      created: Helper.toDateTime(json[CREATED]),
      modified: Helper.toDateTime(json[MODIFIED]),
      lastActive: Helper.toDateTime(json[LASTACTIVE]),
    );
  }

  Map<String, dynamic> toJson() {
    return ({
      ID: id,
      USERNAME: username,
      FULLNAME: fullname,
      EMAIL: email,
      PHONE: phone,
      PASSWORD: password,
      AVATARURL: avatarUrl,
      CREATED: created,
      MODIFIED: modified,
      LASTACTIVE: lastActive?.millisecondsSinceEpoch,
    });
  }
}
