import '../header.dart';

class Pages {
  Pages._();
  static List<GetPage<dynamic>>? getPages = [
    GetPage(
      name: '/',
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: '/home',
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: '/onboarding',
      page: () => const OnboardingScreen(),
    ),
  ];
}
