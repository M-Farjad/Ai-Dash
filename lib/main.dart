import 'header.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Prefs.init();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: CustomTheme.theme,
      darkTheme: CustomTheme.darkTheme,
      initialRoute: Routes.splash,
      getPages: Pages.getPages,
    );
  }
}
