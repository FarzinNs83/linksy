import 'package:flutter/material.dart';
import 'package:front/core/utils/shared_pref_manager.dart';

class DarkModeNotifier extends ChangeNotifier {
  static const _key = 'darkMode';

  static final DarkModeNotifier _instance = DarkModeNotifier._();
  DarkModeNotifier._();
  factory DarkModeNotifier() => _instance;

  bool _isDark = false;
  bool get isDark => _isDark;
  ThemeMode get themeMode => _isDark ? ThemeMode.dark : ThemeMode.light;

  void init() {
    final saved = SharedPref.instance.getBool(_key);
    _isDark = saved ?? false;
    notifyListeners();
  }

  Future<void> toggle() async {
    _isDark = !_isDark;
    await SharedPref.instance.setBool(_key, _isDark);
    notifyListeners();
  }
}
