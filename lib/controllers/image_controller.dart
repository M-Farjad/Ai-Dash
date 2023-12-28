import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

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
    } else {
      MyDialog.getInfo(Strings.provideImageDesc);
    }
  }

  void downloadImage() async {
    try {
      MyDialog.showLoading();
      log(url.value);
      final bytes = (await http.get(Uri.parse(url.value))).bodyBytes;
      final dir = await getTemporaryDirectory();
      final file = await File('${dir.path}/ai_image.png').writeAsBytes(bytes);
      log('FilePath: ${file.path}');
      await GallerySaver.saveImage(file.path, albumName: Strings.appName)
          .then((success) {
        //?if dialog is open then close it
        if (Get.isDialogOpen ?? false) Get.back();
        MyDialog.getSuccess(success.toString());
      });
    } catch (e) {
      //?if dialog is open then close it
      if (Get.isDialogOpen ?? false) Get.back();
      MyDialog.getWarning(e.toString());
    }
  }

  void shareImage() async {
    try {
      MyDialog.showLoading();
      log(url.value);
      final bytes = (await http.get(Uri.parse(url.value))).bodyBytes;
      final dir = await getTemporaryDirectory();
      final file = await File('${dir.path}/ai_image.png').writeAsBytes(bytes);
      log('FilePath: ${file.path}');
      await Share.shareXFiles([XFile(file.path)], text: Strings.shareImageText);
      //?if dialog is open then close it
      if (Get.isDialogOpen ?? false) Get.back();
    } catch (e) {
      //?if dialog is open then close it
      if (Get.isDialogOpen ?? false) Get.back();
      MyDialog.getWarning(e.toString());
    }
  }
}
