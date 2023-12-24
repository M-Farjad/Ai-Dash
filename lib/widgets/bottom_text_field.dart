import '../header.dart';

class BottomTextField extends StatelessWidget {
  const BottomTextField(
      {super.key, required this.controller, required this.onTap});

  final TextEditingController controller;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width * .02),
      child: Row(
        children: [
          ChatTextField(controller: controller),
          const SizedBox(width: 8),
          CircleAvatar(
            radius: 24,
            backgroundColor: CustomColors.primaryColor,
            child: IconButton(
              onPressed: onTap,
              icon: const Icon(
                Icons.rocket_launch_rounded,
                color: CustomColors.white,
                size: 28,
              ),
            ),
          )
        ],
      ),
    );
  }
}
