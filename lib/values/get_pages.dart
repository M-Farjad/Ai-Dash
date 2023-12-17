import '../header.dart';

class Pages {
  Pages._();
  static List<GetPage<dynamic>>? getPages = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.onboarding,
      page: () => OnboardingScreen(),
    ),
  ];
}
