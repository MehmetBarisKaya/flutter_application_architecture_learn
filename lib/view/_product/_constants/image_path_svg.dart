import '../../../core/extension/string_extension.dart';

class SVGImagePath {
  static SVGImagePath? _instance;
  static SVGImagePath get instance {
    _instance ??= SVGImagePath._init();
    return _instance!;
  }

  SVGImagePath._init();

  final relaxSVG = "relax".toSVG;
  final astronautSVG = "astronaut".toSVG;
  final chattingSVG = "chat".toSVG;
}
