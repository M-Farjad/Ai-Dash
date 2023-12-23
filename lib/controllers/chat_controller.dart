import '../header.dart';

class ChatController extends GetxController {
  //! members
  final textController = TextEditingController();
  final list = <Message>[].obs;

  //! methods
  void sendMessage() {
    if (textController.text.trim().isNotEmpty) {
      list.add(Message(type: MessageType.user, msg: textController.text));
      textController.clear();
      list.add(Message(type: MessageType.bot, msg: 'Hello'));
    }
  }
}
