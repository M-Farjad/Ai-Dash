class Message {
  final String msg;
  final MessageType type;

  Message({required this.type, required this.msg});
}

enum MessageType { user, bot }
