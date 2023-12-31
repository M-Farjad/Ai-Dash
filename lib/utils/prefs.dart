import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../header.dart';

class Prefs {
  Prefs._();
  static const String _isDarkMode = 'isDarkMode';

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
  static bool get isDarkMode => _box.get(_isDarkMode, defaultValue: false);
  static set isDarkMode(bool value) => _box.put(_isDarkMode, value);

  static ThemeMode get defaultThemeMode {
    final data = _box.get(_isDarkMode);
    log(data.toString());
    if (data == null) return ThemeMode.system;
    return data ? ThemeMode.dark : ThemeMode.light;
  }
}
