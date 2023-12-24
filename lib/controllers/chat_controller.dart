import '../header.dart';

class ChatController extends GetxController {
  //! members
  final textController = TextEditingController();
  final scrollController = ScrollController();
  final list = <Message>[
    Message(type: MessageType.bot, msg: Strings.greetingsMessage)
  ].obs;

  //! methods
  void sendMessage() async {
    if (textController.text.trim().isNotEmpty) {
      // !User Message
      list.add(Message(type: MessageType.user, msg: textController.text));
      textController.clear();
      list.add(Message(type: MessageType.bot, msg: ''));
      _scrollToBottom();

      // !Bot Message
      final answer = await APIs.getAnswer(textController.text);
      list.removeLast();
      list.add(Message(type: MessageType.bot, msg: answer));
      _scrollToBottom();
    } else {
      MyDialog.getInfo(Strings.enterSomeText);
    }
  }

  void _scrollToBottom() {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}
