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
      iconTheme: const IconThemeData(color: CustomColors.secondaryColor),
      titleTextStyle: Styles.regularUbuntu18(
        CustomColors.secondaryColor,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
  static ThemeData? darkTheme = ThemeData(
    // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      // backgroundColor: Colors.white,
      // iconTheme: const IconThemeData(color: CustomColors.secondaryColor),
      titleTextStyle: Styles.regularUbuntu18(
        CustomColors.secondaryColor,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

extension AppTheme on ThemeData {
  Color get textColor => brightness == Brightness.light
      ? CustomColors.secondaryColor
      : Colors.white70;
  Color get buttonColor => brightness == Brightness.light
      ? CustomColors.secondaryColor
      : CustomColors.secondaryColor;
}
