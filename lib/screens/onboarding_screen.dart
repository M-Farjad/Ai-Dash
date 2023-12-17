import '../header.dart';
import '../models/onboard.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final PageController _pageController = PageController();
  final list = [
    OnBoard(
      title: Strings.askMeAnything,
      subtitle: Strings.greetingsFromApp,
      lottie: Assets.aiAskMe2,
    ),
    OnBoard(
      title: Strings.imagination,
      subtitle: Strings.greetingsFromApp2,
      lottie: Assets.aiPlay,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: list.length,
        controller: _pageController,
        itemBuilder: (context, ind) {
          final isLast = ind == list.length - 1;
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //! Animation
              SizedBox(
                height: Get.height * 0.6,
                child: Lottie.asset(list[ind].lottie),
              ),
              Spacing.getVerticalHeight(.01),
              //! Title
              Text(
                list[ind].title,
                style: Styles.regularMonteAlt28(
                  CustomColors.primaryColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              //! subtitle
              SizedBox(
                width: Get.width * 0.8,
                child: Text(
                  list[ind].subtitle,
                  textAlign: TextAlign.center,
                  style: Styles.regularUbuntu18(CustomColors.secondaryColor),
                ),
              ),
              const Spacer(),
              //! Indicator
              Wrap(
                spacing: 8,
                children: List.generate(
                  list.length,
                  (i) => Container(
                    width: ind == i ? 15 : 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: ind == i
                          ? CustomColors.primaryColor
                          : CustomColors.grey,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              //! Button
              SizedBox(
                width: Get.width * 0.8,
                child: ElevatedButton(
                  onPressed: () => isLast
                      ? Get.offAllNamed(Routes.home)
                      : _pageController.nextPage(
                          duration: const Duration(milliseconds: 600),
                          curve: Curves.ease,
                        ),
                  // Get.toNamed(Routes.login);
                  style: ElevatedButton.styleFrom(
                    // primary: CustomColors.secondaryColor,
                    shape: const StadiumBorder(),
                    elevation: 0,
                    backgroundColor: CustomColors.primaryColor,
                    minimumSize: Size(Get.width * .4, 50),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    isLast ? Strings.getStarted : Strings.next,
                    style: Styles.regularUbuntu18(
                      CustomColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 2),
            ],
          );
        },
      ),
    );
  }
}
