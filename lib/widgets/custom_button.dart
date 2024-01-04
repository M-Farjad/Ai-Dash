import '../header.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      // Get.toNamed(Routes.login);
      style: ElevatedButton.styleFrom(
        // primary: CustomColors.secondaryColor,
        shape: const StadiumBorder(),
        elevation: 0,
        backgroundColor: Theme.of(context).buttonColor,
        minimumSize: Size(Get.width * .4, 50),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      child: Text(
        text,
        style: Styles.regularUbuntu18(
          CustomColors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
