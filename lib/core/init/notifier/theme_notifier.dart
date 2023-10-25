import 'package:flutter/material.dart';

import '../../constants/enums/app_theme_enum.dart';
import 'package:architecture_theme/src/theme/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;
  AppThemes _currentThemeEnum = AppThemes.LIGHT;

  ///Application theme enum.
  ///Default value is [AppThemes.LIGHT].
  AppThemes get currentThemeEnum => _currentThemeEnum;
  ThemeData get currentTheme => _currentTheme;

  void changeValue(AppThemes appTheme) {
    if (appTheme == AppThemes.LIGHT) {
      _currentTheme = ThemeData.light();
    } else {
      _currentTheme = ThemeData.dark();
    }
    notifyListeners();
  }

  ///Change your app theme with [currentThemeEnum] value
  void changeTheme() {
    if (currentThemeEnum == AppThemes.LIGHT) {
      _currentTheme = ThemeData.dark();
      _currentThemeEnum = AppThemes.DARK;
    } else {
      _currentTheme = AppThemeLight.instance.theme;
      _currentThemeEnum = AppThemes.LIGHT;
    }
    notifyListeners();
  }
}
