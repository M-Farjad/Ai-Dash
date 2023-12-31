import '../header.dart';

class Pages {
  Pages._();
  static List<GetPage<dynamic>>? getPages = [
    GetPage(name: Routes.splash, page: () => const SplashScreen()),
    GetPage(name: Routes.home, page: () => HomeScreen()),
    GetPage(name: Routes.onboarding, page: () => OnboardingScreen()),
    GetPage(name: Routes.chatBot, page: () => const ChatBotScreen()),
    GetPage(name: Routes.imageCreator, page: () => const ImageCreatorScreen()),
    GetPage(
      name: Routes.languageTranslator,
      page: () => const LanguageTranslatorScreen(),
    ),
  ];
}
