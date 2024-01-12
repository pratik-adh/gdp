import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = ChangeNotifierProvider((ref) => ThemeNotifier());

class ThemeNotifier extends ChangeNotifier {
  ThemeData _themeData = ThemeData.light();

  ThemeData get themeData => _themeData;

  void toggleDark() {
    _themeData = ThemeData.dark();
    notifyListeners();
  }

  void toggleLight() {
    _themeData = ThemeData.light();
    notifyListeners();
  }
}
