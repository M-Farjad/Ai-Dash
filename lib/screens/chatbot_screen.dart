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
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * .02),
        child: Row(
          children: [
            ChatTextField(),
            const SizedBox(width: 8),
            CircleAvatar(
              radius: 24,
              backgroundColor: CustomColors.primaryColor,
              child: IconButton(
                onPressed: _c.sendMessage,
                icon: const Icon(
                  Icons.rocket_launch_rounded,
                  color: CustomColors.white,
                  size: 28,
                ),
              ),
            )
          ],
        ),
      ),
      body: Obx(() {
        return ListView(
          children: _c.list.map((e) => MessageCard(msg: e)).toList(),
        );
      }),
    );
  }
}
