import '../header.dart';

enum Status { loading, success, none }

class ImageController extends GetxController {
  //! members
  final textController = TextEditingController();
  final url = ''.obs;
  final status = Status.none.obs;
  final list = <Message>[
    Message(type: MessageType.bot, msg: Strings.greetingsMessage)
  ].obs;

  //! methods
  @override
  void onInit() {
    super.onInit();
    OpenAI.apiKey = apiKey;
  }

  void sendMessage() async {
    if (textController.text.trim().isNotEmpty) {
      // textController.clear();
      status.value = Status.loading;
      OpenAIImageModel image = await OpenAI.instance.image.create(
        prompt: textController.text,
        n: 1,
        size: OpenAIImageSize.size512,
        responseFormat: OpenAIImageResponseFormat.url,
      );
      url.value = image.data[0].url.toString();
      status.value = Status.success;
    }
  }
}
