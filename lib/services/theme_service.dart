// ============================================================
// Fichier : lib/services/theme_service.dart
// Rôle    : Gère le thème (clair/sombre) avec persistance.
// ============================================================

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService extends ChangeNotifier {
  static final ThemeService _instance = ThemeService._internal();
  factory ThemeService() => _instance;
  ThemeService._internal();

  static const String _key = 'theme_mode';
  ThemeMode _mode = ThemeMode.system;

  ThemeMode get mode => _mode;
  bool get isDark => _mode == ThemeMode.dark;

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getString(_key) ?? 'system';
    _mode = _fromString(stored);
    notifyListeners();
  }

  Future<void> toggle() async {
    _mode = _mode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, _toString(_mode));
    notifyListeners();
  }

  ThemeMode _fromString(String s) {
    if (s == 'dark') return ThemeMode.dark;
    if (s == 'light') return ThemeMode.light;
    return ThemeMode.system;
  }

  String _toString(ThemeMode m) {
    if (m == ThemeMode.dark) return 'dark';
    if (m == ThemeMode.light) return 'light';
    return 'system';
  }
}
