import '../header.dart';

class MessageCard extends StatelessWidget {
  const MessageCard({super.key, required this.msg});
  final Message msg;
  @override
  Widget build(BuildContext context) {
    return msg.type == MessageType.bot ? buildBotMessage() : buildUserMessage();
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