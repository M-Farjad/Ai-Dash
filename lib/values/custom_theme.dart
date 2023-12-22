import '../header.dart';

class CustomTheme {
  CustomTheme._();
  static ThemeData? theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: CustomColors.primaryColor),
      titleTextStyle: Styles.regularUbuntu18(
        CustomColors.primaryColor,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
