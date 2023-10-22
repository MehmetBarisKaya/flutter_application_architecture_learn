import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum LottiePathEnum { SUNNY, MOON }

extension LottiePathExtension on LottiePathEnum {
  String get rawValue {
    switch (this) {
      case LottiePathEnum.SUNNY:
        return _pathValue("sunny");
      case LottiePathEnum.MOON:
        return _pathValue("moon");
    }
  }

  Widget get toWidget {
    return Lottie.asset(this.rawValue);
  }

  String _pathValue(String path) => "assets/lottie/$path.json";
}
