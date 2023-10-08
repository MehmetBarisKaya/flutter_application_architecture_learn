import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/init/theme/app_theme.dart';

class AppThemeLight extends AppTheme {
  AppThemeLight._init();
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();
    return _instance!;
  }

  ThemeData get theme => ThemeData.light();
}
