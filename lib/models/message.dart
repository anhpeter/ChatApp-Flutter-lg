class Message {
  String? id;
  String? messageReplyId;
  String chatId;
  String senderId;
  String receiverId;
  String text;
  String messageType;
  String? mediaUrl;
  DateTime timestamp;

  Message({
    required this.id,
    this.messageReplyId,
    required this.chatId,
    required this.senderId,
    required this.receiverId,
    required this.text,
    required this.messageType,
    this.mediaUrl,
    required this.timestamp,
  });
}
