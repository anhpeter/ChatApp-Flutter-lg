class Message {
  String id;
  String chatId;
  String senderId;
  String text;
  String messageType;
  DateTime? timestamp;
  String? attachUrl;
  String? messageReplyId;

  Message({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.text,
    required this.messageType,
    this.attachUrl,
    this.messageReplyId,
    this.timestamp,
  });
}
