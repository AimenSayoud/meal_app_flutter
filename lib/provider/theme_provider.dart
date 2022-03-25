import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var primaryColor = Colors.pink;
  var accentColor = Colors.amber;
  var tm = ThemeMode.system;
  String themeText = "s";

  onChanged(color, n) async {
    SharedPreferences prefs = await _prefs;

    n == 1
        ? primaryColor = _setMaterialColor(color.hashCode)
        : accentColor = _setMaterialColor(color.hashCode);

    notifyListeners();
    n == 1
        ? prefs.setInt('primary', color.hashCode)
        : prefs.setInt('accent', color.hashCode);
  }

  getThemeColors() async {
    SharedPreferences prefs = await _prefs;
    primaryColor = _setMaterialColor(prefs.getInt('primary') ?? 0xFFE91E63);
    accentColor = _setMaterialColor(prefs.getInt('accent') ?? 0xFFFFC107);
    notifyListeners();
  }

  themeModeChange(ThemeMode themeMode) async {
    SharedPreferences prefs = await _prefs;
    tm = themeMode;
    _getThemeText(themeMode);
    notifyListeners();
    prefs.setString('theme_mode', themeText);
  }

  _getThemeText(ThemeMode themeMode) {
    if (themeMode == ThemeMode.system) {
      themeText = "s";
    } else if (themeMode == ThemeMode.light) {
      themeText = "l";
    } else if (themeMode == ThemeMode.dark) {
      themeText = "d";
    }
  }

  getThemeMode() async {
    SharedPreferences prefs = await _prefs;

    themeText = prefs.getString("theme_mode") ?? "s";
    if (themeText == "s") {
      tm = ThemeMode.system;
    } else if (themeText == "l") {
      tm = ThemeMode.light;
    } else if (themeText == "d") {
      tm = ThemeMode.dark;
    }

    notifyListeners();
  }

  MaterialColor _setMaterialColor(newColor) {
    return MaterialColor(
      newColor,
      <int, Color>{
        50: Color(0xFFFCE4EC),
        100: Color(0xFFF8BBD0),
        200: Color(0xFFF48FB1),
        300: Color(0xFFF06292),
        400: Color(0xFFEC407A),
        500: Color(newColor),
        600: Color(0xFFD81B60),
        700: Color(0xFFC2185B),
        800: Color(0xFFAD1457),
        900: Color(0xFF880E4F),
      },
    );
  }
}
