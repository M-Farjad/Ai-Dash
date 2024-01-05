import '../header.dart';
import '../widgets/home_card.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final ctrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // APIs.getAnswer("What is the capital of India?");
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appName),
        actions: [
          IconButton(
            // padding: const EdgeInsets.only(right: 10),
            icon: Obx(() => Icon(
                  ctrl.isDarkMode.value ? Icons.light_mode : Icons.dark_mode,
                )),
            onPressed: ctrl.toggleTheme,
          ),
        ],
      ),
      body: ListView(
        children: HomeType.values.map((e) => HomeCard(homeType: e)).toList(),
      ),
    );
  }
}
