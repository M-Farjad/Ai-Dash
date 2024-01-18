import '../header.dart';

class HomeController extends GetxController {
  final isDarkMode = Prefs.isDarkMode.obs;
  @override
  void onInit() async {
    super.onInit();
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Prefs.showOnboarding = false;
  }

  void toggleTheme() {
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.light : ThemeMode.dark);
    isDarkMode.value = !isDarkMode.value;
    Prefs.isDarkMode = !isDarkMode.value;
  }
}
