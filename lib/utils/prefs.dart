import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class Prefs {
  Prefs._();
  static late Box _box;
  static const _boxName = 'MyData';
  static const _showOnboardingPref = 'showOnboarding';

  static Future<void> init() async {
    //!initilize hive
    Hive.defaultDirectory = (await getApplicationDocumentsDirectory()).path;
    _box = Hive.box(name: _boxName);
  }

  static bool get showOnboarding =>
      _box.get(_showOnboardingPref, defaultValue: true);
  static set showOnboarding(bool value) => _box.put(_showOnboardingPref, value);
}
