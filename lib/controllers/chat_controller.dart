import '../header.dart';

class ChatController extends GetxController {
  //! members
  final textController = TextEditingController();
  final list = <Message>[
    Message(type: MessageType.bot, msg: Strings.greetingsMessage)
  ].obs;

  //! methods
  void sendMessage() async {
    if (textController.text.trim().isNotEmpty) {
      list.add(Message(type: MessageType.user, msg: textController.text));
      textController.clear();
      list.add(Message(type: MessageType.bot, msg: Strings.pleaseWait));
      final answer = await APIs.getAnswer(textController.text);
      list.removeLast();
      list.add(Message(type: MessageType.bot, msg: answer));
    }
  }
}
