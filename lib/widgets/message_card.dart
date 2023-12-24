import '../header.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({super.key, required this.msg});
  final Message msg;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child:
          msg.type == MessageType.bot ? buildBotMessage() : buildUserMessage(),
    );
  }

  Row buildBotMessage() {
    return Row(
      children: [
        CircleAvatar(radius: 18, child: Image.asset(Assets.logo, width: 24)),
        const SizedBox(width: 8),
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(8),
            constraints: BoxConstraints(maxWidth: Get.width * .6),
            decoration: BoxDecoration(
              color: msg.type == MessageType.bot
                  ? CustomColors.grey
                  : CustomColors.primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: msg.msg.isEmpty || msg.msg == Strings.greetingsMessage
                ? AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        msg.msg == Strings.greetingsMessage
                            ? Strings.greetingsMessage
                            : Strings.pleaseWait,
                        textStyle: Styles.regularUbuntu13(
                          msg.type == MessageType.bot
                              ? CustomColors.black
                              : CustomColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    repeatForever: false,
                    isRepeatingAnimation: false,
                  )
                : Text(
                    msg.msg,
                    style: Styles.regularUbuntu13(
                      msg.type == MessageType.bot
                          ? CustomColors.black
                          : CustomColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  Row buildUserMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(8),
            constraints: BoxConstraints(maxWidth: Get.width * .6),
            decoration: BoxDecoration(
              color: msg.type == MessageType.bot
                  ? CustomColors.grey
                  : CustomColors.primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Text(
              msg.msg,
              style: Styles.regularUbuntu13(
                msg.type == MessageType.bot
                    ? CustomColors.black
                    : CustomColors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
        const CircleAvatar(radius: 18, child: Icon(Icons.person)),
        const SizedBox(width: 8),
      ],
    );
  }
}
