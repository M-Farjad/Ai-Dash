import '../header.dart';

class CustomTheme {
  CustomTheme._();
  static ThemeData? theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  );
}
