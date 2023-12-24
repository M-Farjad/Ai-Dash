import '../header.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final _c = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.chatWithAiAssistant),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
          BottomTextField(controller: _c.textController, onTap: _c.sendMessage),
      body: Obx(() {
        return ListView(
          controller: _c.scrollController,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(bottom: Get.height * .12),
          children: _c.list.map((e) => MessageCard(msg: e)).toList(),
        );
      }),
    );
  }
}
