import '../header.dart';

class Styles {
  Styles._();

  static TextStyle regularUbuntu8(
    Color color, {
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
  }) =>
      GoogleFonts.ubuntu(
        color: color,
        fontSize: 8,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      );

  static TextStyle regularUbuntu10(Color color,
          {FontWeight fontWeight = FontWeight.normal,
          double letterSpacing = 0}) =>
      GoogleFonts.ubuntu(
        color: color,
        fontSize: 10,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      );

  static TextStyle regularUbuntu11(Color color,
          {FontWeight fontWeight = FontWeight.normal,
          double letterSpacing = 0,
          bool lineThrough = false}) =>
      GoogleFonts.ubuntu(
        color: color,
        fontSize: 11,
        letterSpacing: letterSpacing,
        decoration: lineThrough == true
            ? TextDecoration.lineThrough
            : TextDecoration.none,
        decorationColor: lineThrough == true ? color : null,
        fontWeight: fontWeight,
      );

  static TextStyle regularUbuntu12(
    Color color, {
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
  }) =>
      GoogleFonts.ubuntu(
        color: color,
        fontSize: 12,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
      );

  static TextStyle regularUbuntu13(Color color,
          {FontWeight fontWeight = FontWeight.normal,
          double letterSpacing = 0}) =>
      GoogleFonts.ubuntu(
        color: color,
        fontSize: 13,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      );

  static TextStyle regularMonteAlt28(Color color,
          {FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.montserratAlternates(
        color: color,
        fontSize: 28,
        fontWeight: fontWeight,
      );

  static TextStyle regularMonteAlt16(Color color,
          {FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.montserratAlternates(
        color: color,
        fontSize: 16.3,
        fontWeight: fontWeight,
      );

  static TextStyle regularUbuntu18(Color color,
          {FontWeight fontWeight = FontWeight.normal,
          double letterSpacing = 0}) =>
      GoogleFonts.ubuntu(
        color: color,
        letterSpacing: letterSpacing,
        fontSize: 18,
        fontWeight: fontWeight,
      );

  static TextStyle regularUbuntu20(Color color,
          {FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.ubuntu(
        color: color,
        fontSize: 20,
        letterSpacing: 0.30,
        fontWeight: fontWeight,
      );

  static TextStyle regularUbuntu24(Color color,
          {FontWeight fontWeight = FontWeight.normal,
          double letterSpacing = 0}) =>
      GoogleFonts.ubuntu(
        color: color,
        fontSize: 24,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
      );

  static TextStyle regularUbuntu25(
    Color color, {
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
  }) =>
      GoogleFonts.ubuntu(
        color: color,
        fontSize: 25,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
      );

  static TextStyle regularUbuntu30(
    Color color, {
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
  }) =>
      GoogleFonts.ubuntu(
        color: color,
        fontSize: 30,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight,
      );

  static TextStyle regularUbuntu34(Color color,
          {FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.ubuntu(
        color: color,
        fontSize: 34,
        fontWeight: fontWeight,
        letterSpacing: 0.37,
      );

  static TextStyle regularUbuntu40(Color color,
          {FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.ubuntu(
        color: color,
        fontSize: 40,
        fontWeight: fontWeight,
        letterSpacing: 0.3,
      );

  static TextStyle regularUbuntu14(
    Color color, {
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0,
    bool decoration = false,
  }) =>
      GoogleFonts.ubuntu(
        color: color,
        fontSize: 14,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        decoration: decoration ? TextDecoration.lineThrough : null,
        decorationColor: color,
      );

  static TextStyle regularUbuntu16(Color color,
          {FontWeight fontWeight = FontWeight.normal}) =>
      GoogleFonts.ubuntu(
        color: color,
        fontSize: 16,
        fontWeight: fontWeight,
      );

  static TextStyle regularUbuntu15(
    Color color, {
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = 0.30,
  }) =>
      GoogleFonts.ubuntu(
        color: color,
        fontSize: 15,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      );
}
