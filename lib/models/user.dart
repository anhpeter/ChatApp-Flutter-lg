import 'dart:convert';

class User {
  String id;
  String username;
  String fullname;
  String avatarUrl;
  String email;
  String phone;
  String password;
  DateTime? created;
  DateTime? modified;
  DateTime? lastActive;

  User({
    required this.id,
    required this.username,
    required this.fullname,
    required this.email,
    required this.phone,
    required this.password,
    required this.avatarUrl,
    this.created,
    this.modified,
    this.lastActive,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      username: json['username'],
      fullname: json['fullname'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      avatarUrl: json['avatar_url'],
      created: json['created'] != null ? DateTime(json['created']) : null,
      modified: json['modified'] != null ? DateTime(json['modified']) : null,
      lastActive: json['last_active'] != null ? DateTime(json['last_active']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return ({
      "_id": id,
      "username": username,
      "fullname": fullname,
      "email": email,
      "phone": phone,
      "password": password,
      "avatar_url": avatarUrl,
      "created": created,
      "modified": modified,
      "lastActive": lastActive,
    });
  }
}
