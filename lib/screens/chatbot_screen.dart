import '../header.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
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
            Expanded(
              child: TextFormField(
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '${Strings.askMeAnything}...',
                  hintStyle: Styles.regularUbuntu13(
                    CustomColors.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                  // contentPadding: const EdgeInsets.all(0),
                  isDense: true, //!to reduce the size of text field
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            CircleAvatar(
              radius: 24,
              backgroundColor: CustomColors.primaryColor,
              child: IconButton(
                onPressed: () {},
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
      body: ListView(
        children: [],
      ),
    );
  }
}
