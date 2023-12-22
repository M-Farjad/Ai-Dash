import '../header.dart';

enum HomeType { aiChatBot, aiImage, aiTranslator }

extension MyHomeType on HomeType {
  String get title => switch (this) {
        HomeType.aiChatBot => Strings.aiChatBot,
        HomeType.aiImage => Strings.imageCreator,
        HomeType.aiTranslator => Strings.languageTranslator,
      };
  String get lottie => switch (this) {
        HomeType.aiChatBot => Assets.aiAskMe2,
        HomeType.aiImage => Assets.aiHandWaving,
        HomeType.aiTranslator => Assets.actions,
      };
  bool get leftALign => switch (this) {
        HomeType.aiChatBot => true,
        HomeType.aiImage => false,
        HomeType.aiTranslator => true,
      };
  VoidCallback get onTap => switch (this) {
        HomeType.aiChatBot => () => Get.toNamed(Routes.chatBot),
        HomeType.aiImage => () => Get.toNamed(Routes.imageCreator),
        HomeType.aiTranslator => () => Get.toNamed(Routes.languageTranslator),
      };
}
