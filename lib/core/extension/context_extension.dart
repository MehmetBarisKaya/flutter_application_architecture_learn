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

extension PaddingExtension on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(low);
  EdgeInsets get paddingNormal => EdgeInsets.all(normal);
  EdgeInsets get paddinMedium => EdgeInsets.all(medium);
  EdgeInsets get paddingHigh => EdgeInsets.all(high);
}
