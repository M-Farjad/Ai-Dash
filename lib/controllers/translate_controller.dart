import '../header.dart';

class TranslateController extends GetxController {
  //! members
  final textController = TextEditingController();
  final resController = TextEditingController();
  final from = ''.obs;
  final to = ''.obs;

  //! methods
  void sendMessage() async {
    if (textController.text.trim().isNotEmpty) {
      // !Bot Message
      // final answer = await APIs.getAnswer(textController.text);
      textController.clear();
    } else {
      MyDialog.getInfo(Strings.enterSomeText);
    }
  }
}
