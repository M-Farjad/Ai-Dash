import 'package:ai_dash/utils/apis.dart';

import '../header.dart';
import '../widgets/home_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Prefs.showOnboarding = false;
  }

  @override
  Widget build(BuildContext context) {
    APIs.getAnswer("What is the capital of India?");
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          Strings.appName,
          style: Styles.regularUbuntu18(
            CustomColors.primaryColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            // padding: const EdgeInsets.only(right: 10),
            icon: const Icon(
              Icons.brightness_4_rounded,
              color: CustomColors.primaryColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: HomeType.values.map((e) => HomeCard(homeType: e)).toList(),
      ),
    );
  }
}
