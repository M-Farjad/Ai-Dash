import '../header.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
    required this.controller,
    this.prfIcon,
    required this.hint,
    this.onChanged,
  });

  final TextEditingController? controller;
  final Icon? prfIcon;
  final String hint;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        textAlign: TextAlign.center,
        style: Styles.regularUbuntu13(
          Theme.of(context).textColor,
          fontWeight: FontWeight.w500,
        ),
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          fillColor: Theme.of(context).scaffoldBackgroundColor,
          hintText: hint,
          filled: true,
          hintStyle: Styles.regularUbuntu13(
            Theme.of(context).textColor,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: prfIcon,
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
