import 'dart:ui';

class LocalizationManager {
  LocalizationManager._init();
  static LocalizationManager? _instance;
  static LocalizationManager get instance {
    _instance ??= LocalizationManager._init();
    return _instance!;
  }

  final Locale enLocale = Locale("en", "US");
  final Locale trLocale = Locale("tr", "TR");
  List<Locale> get supportedLocales => [enLocale, trLocale];
}
