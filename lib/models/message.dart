import 'package:chat_app/common/Helper.dart';
import 'package:chat_app/models/user.dart';

class Message {
  static const ID = '_id';
  static const SENDER = 'sender';
  static const TEXT = 'text';
  static const MESSAGETYPE = 'message_type';
  static const TIMESTAMP = 'timestamp';
  static const ATTACHURL = 'attach_url';
  static const MESSAGEREPLYID = 'message_reply_id';

  String id;
  User sender;
  String text;
  String messageType;
  DateTime? timestamp;
  String? attachUrl;
  String? messageReplyId;

  Message({
    required this.id,
    required this.sender,
    required this.text,
    required this.messageType,
    this.attachUrl,
    this.messageReplyId,
    this.timestamp,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json[ID],
      messageType: json[MESSAGETYPE],
      sender: User.fromJson(json[SENDER]),
      text: json[TEXT],
      attachUrl: json[ATTACHURL],
      messageReplyId: json[MESSAGEREPLYID],
      //   timestamp: Helper.toDateTime(json[TIMESTAMP]),
    );
  }
}
