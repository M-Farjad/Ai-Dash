import '../header.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //! Animation
          SizedBox(
            height: Get.height * 0.6,
            child: Lottie.asset(Assets.aiAskMe2),
          ),
          Spacing.getVerticalHeight(.01),
          //! Title
          Text(
            Strings.askMeAnything,
            style: Styles.regularMonteAlt28(
              CustomColors.primaryColor,
              fontWeight: FontWeight.w900,
            ),
          ),
          //! subtitle
          SizedBox(
            width: Get.width * 0.8,
            child: Text(
              Strings.greetingsFromApp,
              textAlign: TextAlign.center,
              style: Styles.regularUbuntu18(CustomColors.secondaryColor),
            ),
          ),
          const Spacer(),
          //! Indicator
          Wrap(
            spacing: 8,
            children: List.generate(
              2,
              (index) => Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: CustomColors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
          const Spacer(),
          //! Button
          SizedBox(
            width: Get.width * 0.8,
            child: ElevatedButton(
              onPressed: () {}
              // Get.toNamed(Routes.login);
              ,
              style: ElevatedButton.styleFrom(
                // primary: CustomColors.secondaryColor,
                shape: const StadiumBorder(),
                elevation: 0,
                backgroundColor: CustomColors.primaryColor,
                minimumSize: Size(Get.width * .4, 50),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                Strings.getStarted,
                style: Styles.regularUbuntu18(
                  CustomColors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
