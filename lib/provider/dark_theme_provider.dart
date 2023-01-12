import 'package:flutter/cupertino.dart';
import '../services/dark_theme_prefs.dart';

class DarkThemeProvider with ChangeNotifier {
  bool _darkTheme = true;
  bool get getDarkThem => _darkTheme;

  DarkThemePrefs darkThemePrefs = DarkThemePrefs();
  set setDarkThem(bool value) {
    _darkTheme = value;
    darkThemePrefs.setDarkThemPrefs(value);
    notifyListeners();
  }
}
