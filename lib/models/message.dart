class Message{
  String id;
  String messageReplyId;
  String chatId;
  String senderId;
  String receiverId;
  String text;
  String messageType;
  String mediaUrl;
  DateTime timestamp;

  Message({
  required this.id,
  required this.messageReplyId,
  required this.chatId,
  required this.senderId,
  required this.receiverId,
  required this.text,
  required this.messageType,
  required this.mediaUrl,
  required this.timestamp,
  });
}