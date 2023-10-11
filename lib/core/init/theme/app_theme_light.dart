import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/constants/app/app_constants.dart';
import 'package:fluttermvvmtemplate/core/init/theme/app_theme.dart';
import 'package:fluttermvvmtemplate/core/init/theme/light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  AppThemeLight._init();
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();
    return _instance!;
  }

  ThemeData get theme => ThemeData(
      colorScheme: _appColorScheme,
      fontFamily: ApplicationConstants.FONT_FAMILY,
      textTheme: textTheme());

  TextTheme textTheme() {
    return TextTheme(
      displayLarge: textThemeLight.displayLarge,
      displayMedium: textThemeLight.displayMedium,
      displaySmall: textThemeLight.displaySmall,
      labelSmall: textThemeLight.overline,
    );
  }

  ColorScheme get _appColorScheme {
    return ColorScheme(
        primary: colorSchemeLight.black,
        secondary: colorSchemeLight.azure,
        surface: Colors.blue,
        background: Colors.white,
        error: Colors.red[800]!,
        onPrimary: Colors.greenAccent,
        onSecondary: Colors.black38,
        onSurface: Colors.white30,
        onBackground: Colors.black12,
        onError: Colors.red,
        brightness: Brightness.light);
  }
}
