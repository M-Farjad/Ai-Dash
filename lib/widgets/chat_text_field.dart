import '../header.dart';

class ChatTextField extends StatelessWidget {
  ChatTextField({super.key});

  final ChatController _c = Get.find<ChatController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        textAlign: TextAlign.center,
        style: Styles.regularUbuntu13(
          CustomColors.primaryColor,
          fontWeight: FontWeight.w500,
        ),
        controller: _c.textController,
        decoration: InputDecoration(
          fillColor: CustomColors.white,
          hintText: '${Strings.askMeAnything}...',
          filled: true,
          hintStyle: Styles.regularUbuntu13(
            CustomColors.grey,
            fontWeight: FontWeight.w500,
          ),
          // contentPadding: const EdgeInsets.all(0),
          isDense: true, //!to reduce the size of text field
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
        ),
      ),
    );
  }
}
