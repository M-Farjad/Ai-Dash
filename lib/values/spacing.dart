import '../header.dart';

class Spacing {
  Spacing._();

  static Widget getVerticalHeight(double height) {
    return SizedBox(height: Get.height * height);
  }

  static Widget getHorizontalWidth(double percentage) {
    return SizedBox(width: Get.width * percentage);
  }
}
