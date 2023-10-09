import 'package:flutter/material.dart';

class TextThemeLight {
  static TextThemeLight? _instance;
  static TextThemeLight get instance {
    _instance ??= TextThemeLight._init();
    return _instance!;
  }

  TextThemeLight._init();

  final TextStyle displayLarge =
      TextStyle(fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5);
  final TextStyle displayMedium =
      TextStyle(fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5);
  final TextStyle displaySmall =
      TextStyle(fontSize: 48, fontWeight: FontWeight.w400);

  final TextStyle overline =
      TextStyle(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5);
}
