import '../header.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key, required this.homeType});
  final HomeType homeType;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: CustomColors.secondaryColor.withOpacity(.15),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: homeType.leftALign
          ? Row(
              children: [
                Lottie.asset(homeType.lottie, width: Get.width * 0.35),
                const Spacer(),
                Text(
                  homeType.title,
                  style: Styles.regularUbuntu18(
                    CustomColors.primaryColor,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
                const Spacer(flex: 2),
              ],
            )
          : Row(
              children: [
                const Spacer(flex: 2),
                Text(
                  homeType.title,
                  style: Styles.regularUbuntu18(
                    CustomColors.primaryColor,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  ),
                ),
                const Spacer(),
                Lottie.asset(homeType.lottie, width: Get.width * 0.35),
              ],
            ),
    );
  }
}
