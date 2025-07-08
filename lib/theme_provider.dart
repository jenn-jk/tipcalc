import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  // properties
  bool _isDarkTheme = false;

  // methods
  get isDarkTheme => _isDarkTheme;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  ThemeData getCurrentTheme() {
    return _isDarkTheme ? ThemeData.dark() : ThemeData.light();
  }
}
