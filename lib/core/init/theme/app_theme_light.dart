import 'package:flutter/material.dart';

import '../../constants/app/app_constants.dart';
import 'app_theme.dart';
import 'light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  AppThemeLight._init();
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init();
    return _instance!;
  }

  ThemeData get theme => ThemeData(
        fontFamily: ApplicationConstants.FONT_FAMILY,
        colorScheme: _appColorScheme,
        textTheme: textTheme(),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
            iconTheme: IconThemeData(color: Colors.black87, size: 21)),
        inputDecorationTheme: InputDecorationTheme(
            focusColor: Colors.black12,
            labelStyle: TextStyle(),
            fillColor: Colors.white,
            contentPadding: EdgeInsets.zero,
            filled: true,
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(width: 0.3)),
            focusedBorder: OutlineInputBorder()),
        scaffoldBackgroundColor: Color(0xfff1f3f8),
        floatingActionButtonTheme:
            ThemeData.light().floatingActionButtonTheme.copyWith(),
        buttonTheme: ThemeData.light().buttonTheme.copyWith(
              colorScheme: ColorScheme.light(
                onError: Color(0xffFF2D55),
              ),
            ),
        tabBarTheme: tabBarTheme,
      );

  TabBarTheme get tabBarTheme {
    return TabBarTheme(
      labelPadding: insets.lowPaddingAll,
      labelColor: _appColorScheme.onSecondary,
      labelStyle: textThemeLight.displaySmall,
      unselectedLabelColor: _appColorScheme.onSecondary.withOpacity(0.2),
      // unselectedLabelStyle: textThemeLight.headline4.copyWith(color: colorSchemeLight.red),
    );
  }

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
        primaryContainer: Colors.white, //xx
        secondary: Colors.green,
        secondaryContainer: colorSchemeLight.azure,
        surface: Colors.blue, //xx
        background: Color(0xfff6f9fc), //xx
        error: Color.fromARGB(255, 239, 7, 69),
        onPrimary: Colors.greenAccent,
        onSecondary: Colors.black, //x
        onSurface: Colors.white30,
        onBackground: Colors.black12,
        onError: Color(0xFFF9B916), //xx
        brightness: Brightness.light);
  }
}
