import 'dart:math';

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get low => 4.0;
  double get normal => 8.0;
  double get medium => 12.0;
  double get high => 16.0;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  ColorScheme get colors => theme.colorScheme;
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(low);
  EdgeInsets get paddingNormal => EdgeInsets.all(normal);
  EdgeInsets get paddinMedium => EdgeInsets.all(medium);
  EdgeInsets get paddingHigh => EdgeInsets.all(high);
}

extension PaddingExtensionSymetric on BuildContext {
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: low);
  EdgeInsets get paddingNormalVertical =>
      EdgeInsets.symmetric(vertical: normal);
  EdgeInsets get paddingMediumVertical =>
      EdgeInsets.symmetric(vertical: medium);
  EdgeInsets get paddingHeightVertical => EdgeInsets.symmetric(vertical: high);

  EdgeInsets get paddingLowHorizontal => EdgeInsets.symmetric(horizontal: low);
  EdgeInsets get paddingNormalHorizontal =>
      EdgeInsets.symmetric(horizontal: normal);
  EdgeInsets get paddingMediumHorizontal =>
      EdgeInsets.symmetric(horizontal: medium);
  EdgeInsets get paddingHeightHorizontal =>
      EdgeInsets.symmetric(horizontal: high);
}

extension PageExtension on BuildContext {
  Color get randomColor => Colors.primaries[Random().nextInt(17)];
}

extension DuratinExtension on BuildContext {
  Duration get durationLow => Duration(milliseconds: 500);
  Duration get durationNormal => Duration(seconds: 1);
}
